# XR FUSION MATH LAB v1.0

**Laboratorio de geometría 2D a 3D con 15 transformaciones y control opcional mediante MediaPipe Hand Landmarker.**

## Instalación XAMPP

1. Descomprima la carpeta `XR_FUSION_MATH_LAB` dentro de `C:\xampp\htdocs\`.
2. Inicie Apache desde el panel de control XAMPP.
3. Abra `http://localhost/XR_FUSION_MATH_LAB/` en Chrome o Edge.
4. Seleccione una figura, ajuste radio y altura, presione **Animar** y observe la construcción.
5. Opcionalmente active la cámara: otorgue permiso cuando el navegador lo solicite.
6. La cámara primero se abre; después se descarga MediaPipe y su modelo. Espere el texto **MediaPipe listo**.

**Aviso importante:** la representación matemática 3D usa un renderizador Canvas propio, **no requiere Three.js ni Internet**. MediaPipe sí requiere cargar una biblioteca, su runtime WASM y el modelo; se intentará primero desde el directorio `vendor/mediapipe`, y después desde dos CDN. El instalador opcional descarga estas dependencias para poder trabajar localmente.

**Si la cámara abre pero MediaPipe falla:** cierre la app, ejecute `INSTALAR_MEDIAPIPE_LOCAL.bat` en Windows (necesita Internet una sola vez), abra XAMPP de nuevo y presione Ctrl + F5. Si su red bloquea el acceso a fuentes externas, hable con su administrador. Alternativamente trabaje con mouse sin perder las funciones geométricas.

## Gestos y acciones

| Gesto | Acción |
|---|---|
| Palma abierta en movimiento | Rotar el sólido |
| Palma abierta y quieta alrededor de 1,2 s | Ocultar/mostrar la ficha lateral |
| Índice levantado | Señalar botones del visor y seleccionarlos por permanencia (1 s) |
| Pinza (índice + pulgar) | Arrastrar verticalmente: regular progreso 2D → 3D; horizontal: rotar |
| Dos manos separándose / acercándose | Ampliar o reducir el modelo |
| Puño cerrado y estable alrededor de 1 s | Restablecer la vista |

El reconocimiento de estos gestos es **heurístico**: sobre landmarks de MediaPipe se han programado reglas de distancia, extensión de dedos y permanencia. Dependiendo de iluminación, encuadre, versión del navegador y anatomía, puede necesitar recalibración.

## Funciones adicionales

- **Superponer cámara:** visualiza la geometría sobre la imagen real; es una **superposición demostrativa**, no RA espacial con seguimiento SLAM ni anclaje fijo al mundo.
- **Capturar:** guarda un PNG de la forma 3D.
- **Animación 0–100%:** en las extrusiones, cambia la altura; en las revoluciones, el ángulo barrido; en las pirámides, converge la sección superior hacia el ápice.
- **Control de radio/tamaño y altura:** actualiza la geometría 3D, volumen y área. Para el cubo, la altura se fija a la arista.
- **Aristas visibles:** alterna malla; **Giro automático**: anima la rotación de cámara.
- **Retos:** incluye preguntas y soluciones sobre fórmulas, proporciones y transformaciones.

## 15 experiencias geométricas

| Nº | Figura original | Procedimiento | Sólido |
|---:|---|---|---|
| 01 | Círculo | Extrusión | Cilindro |
| 02 | Semicírculo | Revolución alrededor del diámetro | Esfera |
| 03 | Rectángulo | Revolución alrededor de un lado | Cilindro |
| 04 | Triángulo rectángulo | Revolución alrededor de un cateto | Cono |
| 05 | Parábola (región limitada) | Revolución | Paraboloide |
| 06 | Cuadrado | Extrusión igual a lado | Cubo |
| 07 | Rectángulo | Extrusión | Prisma rectangular |
| 08 | Triángulo equilátero | Extrusión | Prisma triangular |
| 09 | Cuadrado | Convergencia a vértice | Pirámide cuadrangular |
| 10 | Triángulo | Convergencia a vértice | Pirámide triangular |
| 11 | Hexágono regular | Extrusión | Prisma hexagonal |
| 12 | Trapecio rectángulo | Revolución | Tronco de cono |
| 13 | Semielipse | Revolución | Elipsoide |
| 14 | Corona circular | Extrusión | Cilindro hueco |
| 15 | Elipse | Extrusión | Cilindro elíptico |

## Precisión matemática

Se distingue **círculo (región circular)** de **circunferencia (frontera)**, y **semicírculo (región)** del arco. Una curva en revolución genera una superficie; el barrido de una región genera el sólido. El cilindro por revolución se forma girando un rectángulo completo, no solo el segmento exterior. La parábola se considera junto con una región acotada para definir un paraboloide de volumen finito. Las fórmulas describen el sólido final. En la animación se muestra el desarrollo geométrico y no se atribuye el volumen final a los estados intermedios. El área superficial del elipsoide se calcula con la expresión de esferoide; el perímetro de la elipse se aproxima por Ramanujan.

## Publicar en GitHub Pages

Suba todo el directorio (excepto archivos opcionales innecesarios), habilite **Settings → Pages → Deploy from a branch → main / root** y abra `https://USUARIO.github.io/REPOSITORIO/`. Para MediaPipe, use HTTPS. Tenga en cuenta que al publicarlo sin los binarios locales necesitará conectividad hacia los CDN y Google Storage.

## Estructura

```text
XR_FUSION_MATH_LAB/
  index.html
  css/styles.css
  js/app.js
  js/gestures.js
  vendor/mediapipe/LEEME.txt
  scripts/instalar_mediapipe.ps1
  INSTALAR_MEDIAPIPE_LOCAL.bat
  docs/GUIA_DOCENTE.md
  README.md
```

## Referencias

- Google AI Edge, Hand Landmarker Web: https://developers.google.com/edge/mediapipe/solutions/vision/hand_landmarker/web_js
- Google AI Edge, Hand Landmarker API: https://developers.google.com/edge/api/mediapipe/js/tasks-vision.handlandmarker
- Documento del usuario: `material Math.docx` (cuerpos redondos, poliedros, extrusión, revolución y transformaciones geométricas).

Proyecto de carácter educativo. No envía vídeo a servidores de aplicación: la captura y la inferencia se ejecutan en el navegador; la descarga inicial de librerías/modelos sí utiliza proveedores externos cuando los archivos locales no están instalados.

## Corrección v1.1

- Se corrigió la generación de la figura **Semicírculo → Esfera** para usar el perfil matemático exacto del semicírculo al girar alrededor de su diámetro.
- Se ajustó también la generación del **Elipsoide de revolución** para evitar extremos puntiagudos y respetar su perfil elíptico.
- Esta versión reemplaza la geometría anterior basada en una interpolación sinusoidal visualmente aproximada.
