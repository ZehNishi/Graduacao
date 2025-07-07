import numpy as np
from PIL import Image
import os


def load_image(image_path):
    img = Image.open(image_path)
    img_array = np.array(img, dtype=np.float32)
    return img_array

def discrete_derivative(image_array):
   
    derivative_x = np.diff(image_array, axis=1, prepend=image_array[:,0:1])
    derivative_y = np.diff(image_array, axis=0, prepend=image_array[0:1,:])
    
    derivative_magnitude = np.sqrt(derivative_x**2 + derivative_y**2)*20
    
    return derivative_magnitude 


def save_image(image_array, output_path):
    img = Image.fromarray(np.clip(image_array, 0, 255).astype(np.uint8))
    img.save(output_path)


def process_all_images(input_folder, output_folder):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    
    for filename in os.listdir(input_folder):
        if filename.endswith('.png'):
            input_image_path = os.path.join(input_folder, filename)
            
            img_array = load_image(input_image_path)
            
            derivative= discrete_derivative(img_array)
            
            output_image_path_x = os.path.join(output_folder, f'{os.path.splitext(filename)[0]}_derivada.png')
            
            save_image(derivative, output_image_path_x)
            
            print(f"Processado: {filename}")


input1_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\sinalizador'
output1_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\derivadas_sinalizador'


input2_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\amortecedor'
output2_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\derivadas_amortecedor'

input3_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\nada'
output3_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\derivadas_nada'

input4_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\isolador'
output4_folder = r'C:\Users\Jose\Documents\Projeto_RP\imagens_simu\derivadas_isolador'



process_all_images(input1_folder, output1_folder)
process_all_images(input2_folder, output2_folder)
process_all_images(input3_folder, output3_folder)
process_all_images(input4_folder, output4_folder)

print("Processamento de todas as imagens concluído.")
