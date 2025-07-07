% Resolução do grid
L_vals = linspace(0, 100, 20); % Luminosidade
a_vals = linspace(-128, 127, 40); % Componente a*
b_vals = linspace(-128, 127, 40); % Componente b*

% Inicializar listas para armazenar valores válidos
L_plot = [];
a_plot = [];
b_plot = [];
colors = [];

% Iterar pelo espaço LAB
for L = L_vals
    for a = a_vals
        for b = b_vals
            lab_color = [L, a, b];
            rgb_color = lab2rgb(lab_color, 'OutputType', 'double');
            if all(rgb_color >= 0 & rgb_color <= 1) % Checar cores válidas
                L_plot(end+1) = L; %#ok<SAGROW>
                a_plot(end+1) = a; %#ok<SAGROW>
                b_plot(end+1) = b; %#ok<SAGROW>
                colors(end+1, :) = rgb_color; %#ok<SAGROW>
            end
        end
    end
end

% Plotar o espaço LAB em 3D
figure;
scatter3(a_plot, b_plot, L_plot, 15, colors, 'filled');
xlabel('a*');
ylabel('b*');
zlabel('L');
title('Espaço de Cores LAB');
grid on;
axis equal;
