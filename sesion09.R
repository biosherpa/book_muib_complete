

library(epiR)

# Simulación de datos clínicos (Cohorte de enfermedad coronaria)
## ---- simulacion-epir-deR
set.seed(2026)
n <- 1000
prevalencia_real <- 0.15 # 15% de pacientes enfermos en la población

estado_real <- factor(rbinom(n, 1, prevalencia_real), levels = c(0, 1), labels = c("Sano", "Enfermo"))
biomarcador <- rnorm(n, mean = 40 + 12 * as.numeric(estado_real), sd = 10)
punto_corte <- 52

resultado_prueba <- factor(ifelse(biomarcador > punto_corte, 1, 0), levels = c(0, 1), labels = c("Negativo", "Positivo"))

# Construcción de la matriz de contingencia para epi.tests
VP <- sum(resultado_prueba == "Positivo" & estado_real == "Enfermo")
FP <- sum(resultado_prueba == "Positivo" & estado_real == "Sano")
FN <- sum(resultado_prueba == "Negativo" & estado_real == "Enfermo")
VN <- sum(resultado_prueba == "Negativo" & estado_real == "Sano")

matriz_epir <- matrix(c(VP, FP, FN, VN), nrow = 2, byrow = TRUE)
colnames(matriz_epir) <- c("Enfermo", "Sano")
rownames(matriz_epir) <- c("Test +", "Test -")

# Evaluación diagnóstica automatizada con intervalos de confianza
resultados_diagnosticos <- epi.tests(matriz_epir, conf.level = 0.95)
# Muestra directamente la tabla de métricas con estimación e IC95%
print(resultados_diagnosticos$detail)