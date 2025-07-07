import pandas as pd

# Ler o arquivo CSV
df = pd.read_csv('Holder.csv')
first_column = df.iloc[:, 0]  # Pega a primeira coluna
remaining_columns = df.iloc[:, 1:]  # Pega as demais colunas


# Função para processar valores
def process_value(x):
    try:
        # Tenta converter o valor para float
        num = float(x)
        if abs(num) > 2:
            return num / 1000  # Divide por 100
        return num  # Retorna o número como está
    except ValueError:
        # Se não for possível converter para float, retorna o valor original
        return x

# Aplicar a função em todo o DataFrame
remaining_columns = remaining_columns.applymap(process_value)

# Combinar a primeira coluna (inalterada) com as colunas processadas
df = pd.concat([first_column, remaining_columns], axis=1)


# Salvar o arquivo modificado
df.to_csv('keypoint.csv', index=False)

print("Processamento concluído e arquivo salvo como 'keypoint_modified.csv'.")

