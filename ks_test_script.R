# ks_test_script.R

# Função para realizar o teste de Kolmogorov-Smirnov
ks_test <- function(data) {
  ks_result <- ks.test(data, "pnorm")  # Substitua "pnorm" pela distribuição desejada
  return(ks_result)
}

# Solicitação dos dados ao usuário
user_data <- readline("Insira os dados separados por espaços (ex: 1.2 3.4 5.6): ")
user_data <- as.numeric(strsplit(user_data, " ")[[1]])

# Realiza o teste de Kolmogorov-Smirnov
result <- ks_test(user_data)

# Exibe o resultado
cat("Estatística D:", result$statistic, "\n")
cat("Valor p:", result$p.value, "\n")
