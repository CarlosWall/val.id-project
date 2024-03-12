# Lê os dados do formulário HTML
dados <- strsplit(URLdecode(gsub('data=', '', Sys.getenv('QUERY_STRING'))), ',')[[1]]

# Realiza o teste de Kolmogorov-Smirnov
resultado <- ks.test(as.numeric(dados), "pnorm", mean = mean(as.numeric(dados)), sd = sd(as.numeric(dados)))

# Imprime o resultado
cat(sprintf("Statistic: %.4f\n", resultado$statistic))
cat(sprintf("P-value: %.4f\n", resultado$p.value))
cat(sprintf("Resultado: %s\n", ifelse(resultado$p.value < 0.05, "Rejeitar H0", "Aceitar H0")))
