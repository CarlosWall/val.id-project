pip install flask scipy

from flask import Flask, render_template, request
from scipy.stats import ks_2samp
import numpy as np

app = Flask(__name__)

def perform_ks_test(data):
    # Realiza o teste estatístico de Kolmogorov-Smirnov
    # Aqui, estamos usando uma distribuição cumulativa padrão como exemplo
    sample_data = np.sort(np.array(data))
    expected_data = np.sort(np.random.rand(len(data)))
    ks_statistic, ks_p_value = ks_2samp(sample_data, expected_data)
    return ks_statistic, ks_p_value

@app.route('/', methods=['GET', 'POST'])
def index():
    result = None

    if request.method == 'POST':
        # Obtém os dados do formulário
        user_data = request.form.get('user_data')

        # Converte os dados inseridos pelo usuário em uma lista de floats
        user_data_list = [float(x) for x in user_data.split(',')]

        # Realiza o teste de Kolmogorov-Smirnov
        ks_statistic, ks_p_value = perform_ks_test(user_data_list)

        # Formata o resultado para exibição na página
        result = f"KS Statistic: {ks_statistic:.4f}, P-Value: {ks_p_value:.4f}"

    return render_template('index.html', result=result)

if __name__ == '__main__':
    app.run(debug=True)
