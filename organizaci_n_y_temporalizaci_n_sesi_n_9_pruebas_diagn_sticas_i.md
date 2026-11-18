# Organización y Temporalización: Sesión 9 (Tema 5 - Parte I)
**Asignatura:** Método Científico y Análisis de Datos  
**Titulación:** Máster Universitario en Investigación Biomédica | Universidad Rey Juan Carlos  
**Formato:** Sesión presencial integrada (Teoría y Laboratorio de Informática)  
**Duración Total:** 2 horas (120 minutos)

---

## 1. Contexto en la Guía Docente
* **Bloque Temático:** Tema 5: Evaluación de pruebas diagnósticas.
* **Competencias asociadas:** Técnicas de análisis en validación diagnóstica; cálculo y valoración de parámetros sensibles (sensibilidad, especificidad, valores predictivos) para su aplicación a distintos contextos clínicos.
* **Actividades formativas vinculadas:** 
  * Clases teóricas expositivas y participativas.
  * Resolución de ejercicios y casos prácticos en laboratorio de informática con R (`epiR`).
  * Estudio de casos aplicados a la toma de decisiones clínicas y epidemiológicas.

---

## 2. Cronograma Detallado de la Sesión (120 Minutos)

### Bloque 1: Fundamentos Teóricos y Razonamiento Clínico (45 minutos)
* **00:00 - 00:15 | Introducción conceptual y validez de criterio:**
  * Distinción metodológica entre *fiabilidad* (repetibilidad) y *validez* (exactitud).
  * Enfoques de validez (contenido, constructo y criterio / *gold standard*).
  * Estructura de la matriz de confusión de $2 \times 2$ ($VP, FP, FN, VN$).
* **00:15 - 00:30 | Métricas de rendimiento diagnóstico:**
  * Definición e interpretación analítica de la **Sensibilidad** ($\text{Se}$) y la **Especificidad** ($\text{Sp}$).
  * Definición de los **Valores Predictivos** ($\text{VPP}$ y $\text{VPN}$).
* **00:30 - 00:45 | Teorema de Bayes, Odds y Razones de Verosimilitud:**
  * El espacio completo de sucesos y el Teorema de las Probabilidades Totales.
  * Inversión de condiciones: el paso de $P(S \mid E)$ a $P(E \mid S)$.
  * Transición de probabilidades a *odds* y aplicación del **Factor de Bayes** ($\text{Likelihood Ratios}: \text{LR}^+, \text{LR}^-$).

---

### Bloque 2: Práctica Guiada y Código en R en el Aula (45 minutos)
* **00:45 - 00:55 | Preparación del entorno y datos:**
  * Importación del conjunto de datos simulado (`_data/preven_cc.csv`).
  * Dicotomización de la variable continua mediante puntos de corte (`cut()` e `ifelse`).
* **00:55 - 01:15 | El control de la orientación en tablas de contingencia:**
  * Análisis del error crítico de orientación en `epi.tests()` (Fila 1 = Positivo, Columna 1 = Enfermo).
  * Uso de `levels` y `relevel()` para corregir la matriz antes de la evaluación.
* **01:15 - 01:30 | Ejecución automatizada e interpretación inferencial:**
  * Llamada al paquete `epiR` (`epi.tests()`).
  * Lectura conjunta de la estimación puntual y los intervalos de confianza al 95% (distinción entre proporciones binomiales y parámetros asimétricos).

---

### Bloque 3: Cierre, Debate e Intersesión (30 minutos)
* **01:30 - 01:40 | Debate crítico sobre la prevalencia:**
  * Análisis del impacto del cambio de escenario (clínica vs. cribado / *screening*).
  * Discusión sobre por qué se desploma el VPP en baja prevalencia a pesar de una alta especificidad.
* **01:40 - 02:00 | Presentación de la Tarea Intersesión (`prevecor.csv`):**
  * Explicación de los tres apartados de la tarea autónoma del alumnado.
  * Demostración opcional de tablas profesionales reproducibles con el paquete `gt`.

---

## 3. Trabajo Autónomo del Alumnado (Fuera del Aula)
* **Tiempo estimado de dedicación:** 2 a 3 horas de trabajo personal para la resolución del caso práctico con el dataset `prevecor.csv`.
* **Entregable:** Cuestionario resuelto con los cálculos analíticos de los apartados 1 y 2, junto con la justificación crítica del apartado 3 sobre la utilidad de la hs-PCR como prueba de confirmación (*Rule-In*) frente a cribado.