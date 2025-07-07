% (a) Explique como foi gerado o círculo na imagem sintética obtida com a função makeImSynthHex,
% utilizada nas Notas de Aula e Prática MATLAB desta aula. 
% 
% R: Primeiro é criada uma matriz gaussiana de tamanho r x c então o circulo é formatado pelo linha:
% circ = circ < max(circ(:))/10; que joga 1 para valores da matriz menores que 10% do máximo dela 
% e 0 para todos os outros, como a matriz segue uma distribuição gaussiana centrada no tamanho da
% imagem é criado um circulo.


% (b) Responda: qual a maneira mais fácil de alterar o diâmetro do círculo?
% 
% R: Alterando a função circ = circ < max(circ(:))/10; mudando o valor de 10% para outro desejado
% sendo que valores maiores de porcentagem fazem um circulo menor e vice versa.