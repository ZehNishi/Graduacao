import subprocess

def executar_comando_ros():
   
    with open('saida.csv', 'w') as arquivo_saida:
        
        subprocess.call(['rosrun', 'ic_robo', 'vison_simu'], stdout=arquivo_saida)

if __name__ == "__main__":
    executar_comando_ros()
