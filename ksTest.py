pip install flask

# Importa as bibliotecas necessárias
from flask import Flask, render_template, request
import numpy as np
from scipy.stats import ks_2samp

# Inicializa a aplicação Flask
app = Flask(__name__)

# Rota inicial - Página principal
@app.route('/')
def index():
    return render_template('index.html')

# Rota para processar os dados e realizar o teste de Kolmogorov-Smirnov
@app.route('/resultado', methods=['POST'])
def resultado():
    # Obtém os dados do formulário
    dados_amostra1 = list(map(float, request.form.get('amostra1').split(',')))
    dados_amostra2 = list(map(float, request.form.get('amostra2').split(',')))

    # Realiza o teste de Kolmogorov-Smirnov
    resultado_teste = ks_2samp(dados_amostra1, dados_amostra2)

    # Exibe o resultado na página de resultados
    return render_template('resultado.html', resultado_teste=resultado_teste)

# Roda a aplicação
if __name__ == '__main__':
    app.run(debug=True)
