# ks_test_script.R

# Função para realizar o teste de Kolmogorov-Smirnov
ks_test <- function(data1, data2) {
  result <- ks.test(data1, data2)
  return(result)
}

# Solicitação dos dados ao usuário para os dois grupos
user_data1 <- readline(prompt = "Insira os dados do Grupo 1 separados por espaços (ex: 1.2 3.4 5.6): ")
user_data1 <- as.numeric(strsplit(user_data1, " ")[[1]])

user_data2 <- readline(prompt = "Insira os dados do Grupo 2 separados por espaços (ex: 1.2 3.4 5.6): ")
user_data2 <- as.numeric(strsplit(user_data2, " ")[[1]])

# Realiza o teste de Kolmogorov-Smirnov
result <- ks_test(user_data1, user_data2)

# Exibe o resultado
cat("Estatística D:", result$statistic, "\n")
cat("Valor p:", result$p.value, "\n")
