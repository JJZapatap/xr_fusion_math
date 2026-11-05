# Lista de verificación XR FUSION MATH LAB

Esta lista distingue lo comprobado en pruebas automatizadas de las funciones pendientes de cámara física.

## Geometría / matemáticas — comprobado por ejecución de código sin navegador
- [x] Catálogo de 15 experiencias definido y seleccionable en la lógica de interfaz.
- [x] Generación de mallas para 15 cuerpos con vértices y caras válidos.
- [x] Valores de volumen y área finitos para dimensiones iniciales.
- [x] Etapas de transformación 0, 1, 25, 50, 95 y 100 % sin coordenadas no numéricas.
- [x] Rutina de dibujo invocada en un entorno de elementos simulados, sin excepciones.
- [x] JavaScript del motor y MediaPipe verificado con `node --check`.

## Pruebas manuales que debe realizar el usuario en XAMPP
- [ ] Al abrir http://localhost/XR_FUSION_MATH_LAB/ aparecen 15 experiencias.
- [ ] El panel central muestra figura 2D a la izquierda y sólido 3D a la derecha.
- [ ] Arrastrar sobre el sólido rota la vista, la rueda controla zoom.
- [ ] Seleccionar círculo, animar a 0 %, 25 %, 50 %, 100 % y observar el cilindro.
- [ ] Seleccionar semicircunferencia/disco y observar la esfera por revolución.
- [ ] Cambiar radio y altura: se actualizan volumen y área.
- [ ] Verificar cubo: altura bloqueada e igual a la longitud de su arista.
- [ ] Botón Capturar descarga PNG.
- [ ] Botón Activar cámara enciende vídeo y solicita permiso.
- [ ] Aparece el mensaje «MediaPipe listo» luego de descargar/cargar modelo.
- [ ] Palma abierta en movimiento rota el sólido.
- [ ] Índice seleccionado por permanencia activa Anterior/Siguiente/Animar/Restaurar.
- [ ] Pinza modifica el progreso del sólido.
- [ ] Dos manos juntas y separadas ajustan el zoom.
- [ ] Puño estable restablece la vista.
- [ ] Superponer cámara muestra el vídeo de fondo con el sólido adelante.
- [ ] Detener cámara apaga vídeo y libera el recurso.
- [ ] Abrir en otro equipo o GitHub Pages (HTTPS) con compatibilidad de cámara.

## Diagnóstico si la cámara abre pero no reconoce gestos

- Compruebe que el mensaje indique «MediaPipe listo» (no basta «Cámara activa»).
- Abra F12 → Consola y compruebe el origen del fallo: módulo, WASM o modelo.
- Intente con otra conexión autorizada si el CDN está bloqueado.
- Ejecute `INSTALAR_MEDIAPIPE_LOCAL.bat`, vuelva a cargar con Ctrl + F5.
- Asegure buena iluminación y enfoque con una sola mano antes de probar dos.
- Si no aparece la cámara, revise permisos del navegador y use localhost/HTTPS.
