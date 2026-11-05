# Guía docente — XR FUSION MATH LAB

**Área:** Matemáticas, geometría plana y espacial, educación STEAM, visión computacional y RA.

**Objetivo:** explicar y justificar cómo las transformaciones geométricas extrusión, revolución y convergencia hacia un vértice producen sólidos 3D, calcular sus volúmenes y áreas, y emplear gestos como interfaz de aprendizaje.

## Sesión de 90 minutos

1. **Activación (10 min).** Proyecte un círculo plano. Pregunte: ¿cuál es la diferencia entre circunferencia y círculo? ¿Un disco que se desplaza produce un cilindro? ¿Una semicircunferencia que gira genera superficie o sólido?
2. **Demostración (15 min).** Construya el cilindro desde un círculo. Use 0%–100%, varíe radio y altura, observe V y A. Repita con rectángulo por revolución para llegar al mismo sólido.
3. **Comparación (15 min).** Ponga cono y cilindro con igual radio y altura. Compruebe V_cono = V_cilindro/3. Repita pirámide/prisma de misma base.
4. **Exploración (20 min).** Equipos de 3 estudiantes eligen cinco figuras distintas, describen la transformación y contrastan las fórmulas.
5. **Gestos (15 min).** Activar cámara. Practicar palma, pinza, dos manos, puño. Analizar relación entre coordenadas detectadas y control de progreso.
6. **Cierre (15 min).** Mini exposición: justificar una transformación y explicar límites de la superposición de cámara frente a RA anclada.

## Taller evaluable

Producto: captura de 5 sólidos, tabla con figura 2D, método, volumen calculado para dimensiones elegidas y fórmula; explicación corta y evidencia de interacción por gestos o mouse.

**Rúbrica / 100 puntos:** construcción geométrica y procedimiento correcto 30; cálculos y unidades 25; comparación razonada de sólidos 20; interacción con la app y evidencia 15; explicación pedagógica y comunicación 10. Permita alternativa con mouse para accesibilidad y si no se puede usar cámara.

## Preguntas para debate

- ¿Cuál es la diferencia entre extruir una región y girar su frontera?
- ¿Qué relaciones de volumen se mantienen al igualar base y altura?
- ¿Por qué girar una parábola requiere acotar la altura para hallar un volumen finito?
- ¿Cómo cambia V al duplicar la longitud, el radio o la altura?
- ¿Qué significa tener un sólido renderizado sobre vídeo sin anclaje espacial?

## Recomendaciones

- Revise permisos de cámara en `localhost`/HTTPS antes de la clase; si falla, los sólidos funcionan sin IA.
- Utilice una proyección con poco reflejo, buena iluminación y fondo contrastante para la cámara.
- Explique que MediaPipe aporta puntos de referencia de manos; la geometría y los cálculos proceden del código matemático de la aplicación.
- No presente la solución como sustituto de CAD, un sistema RA con SLAM o un instrumento de medición metrológica.
