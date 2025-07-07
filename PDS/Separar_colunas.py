import pandas as pd

# Função para remover parênteses e dividir os números em colunas
def split_numbers(row):
    numbers = row.strip('()').split(', ')
    return pd.Series(numbers)

# Carregar o arquivo CSV excluindo as colunas indesejadas
columns_to_keep = ['time', '.header.seq', '.header.stamp.secs', '.header.stamp.nsecs', '.header.frame_id', '.angle_min', '.angle_max', '.angle_increment', '.time_increment', '.scan_time', '.range_min', '.range_max', '.intensities']
data = pd.read_csv("/home/jose/bagfiles/teste2-vison.csv", usecols=lambda col: col not in columns_to_keep)

# Aplicar a função split_numbers na coluna .ranges
split_data = data[".ranges"].apply(split_numbers)

# Renomear as colunas
split_data.columns = [f"Leitura_{i}" for i in range(split_data.shape[1])]

# Concatenar os dados divididos com o dataframe original
result = pd.concat([data, split_data], axis=1)

# Excluir a coluna .ranges
result.drop(columns=".ranges", inplace=True)

# Salvar o resultado de volta no arquivo original
result.to_csv("/home/jose/bagfiles/teste2-vison.csv", index=False)

