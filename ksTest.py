pip install flask

# Rota para processar os dados e realizar o teste de Kolmogorov-Smirnov
@app.route('/resultado', methods=['POST'])
def resultado():
    # Obtém os dados do formulário
    dados_amostra1 = list(map(float, request.form.get('amostra1').split(',')))
    dados_amostra2 = list(map(float, request.form.get('amostra2').split(',')))

    # Realiza o teste de Kolmogorov-Smirnov
    resultado_teste = ks_2samp(dados_amostra1, dados_amostra2)

    # Exibe o resultado na página de resultados
    return render_template('resultado.html', statistic=resultado_teste.statistic, pvalue=resultado_teste.pvalue)
