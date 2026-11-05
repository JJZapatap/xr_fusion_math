$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$root = Split-Path -Parent $PSScriptRoot
$vendor = Join-Path $root 'vendor\mediapipe'
$wasm = Join-Path $vendor 'wasm'
New-Item -ItemType Directory -Force -Path $wasm | Out-Null
$version = '0.10.21'
$base = "@mediapipe/tasks-vision@$version"
$urls = @(
  "https://cdn.jsdelivr.net/npm/$base",
  "https://unpkg.com/$base"
)
function Download-File($rel, $destination, [int]$minBytes) {
  foreach ($u in $urls) {
    try {
      $uri = "$u/$rel"
      Write-Host "Descargando: $uri"
      Invoke-WebRequest -Uri $uri -OutFile $destination -UseBasicParsing -TimeoutSec 65
      $size = (Get-Item $destination).Length
      if ($size -lt $minBytes) { throw "Archivo demasiado pequeno ($size bytes)" }
      Write-Host "OK: $rel - $size bytes" -ForegroundColor Green
      return
    } catch {
      Write-Host "No disponible desde este servidor: $($_.Exception.Message)" -ForegroundColor Yellow
      Remove-Item $destination -Force -ErrorAction SilentlyContinue
    }
  }
  throw "No fue posible descargar $rel. Pruebe otra red o conectividad a npm CDN."
}
Download-File 'vision_bundle.mjs' (Join-Path $vendor 'vision_bundle.mjs') 50000
$wasmFiles = @('vision_wasm_internal.js','vision_wasm_internal.wasm','vision_wasm_nosimd_internal.js','vision_wasm_nosimd_internal.wasm')
foreach($f in $wasmFiles){
  $minimum = 1000
  if($f.EndsWith('.wasm')){ $minimum = 100000 }
  Download-File "wasm/$f" (Join-Path $wasm $f) $minimum
}
$task = Join-Path $vendor 'hand_landmarker.task'
$source = 'https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task'
Write-Host "Descargando modelo de manos: $source"
Invoke-WebRequest -Uri $source -OutFile $task -UseBasicParsing -TimeoutSec 120
if((Get-Item $task).Length -lt 100000){throw 'Modelo descargado de forma incompleta'}
Write-Host 'Paquete y modelo preparados en vendor/mediapipe.' -ForegroundColor Green
