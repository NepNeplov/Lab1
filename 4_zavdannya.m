figure;

% Побудова точок кожного класу
scatter3(X_normalized(1, T==0), X_normalized(2, T==0), X_normalized(3, T==0), ...
    'ro', 'filled'); hold on;
scatter3(X_normalized(1, T==1), X_normalized(2, T==1), X_normalized(3, T==1), ...
    'b+', 'LineWidth', 2);

% Отримання ваг та зсуву
w = net.IW{1,1};
b = net.b{1};

% Побудова розділяючої площини, якщо коефіцієнт при x3 ≠ 0
if w(3) ~= 0
    [x1, x2] = meshgrid(...
        linspace(min(X_normalized(1,:)), max(X_normalized(1,:)), 20), ...
        linspace(min(X_normalized(2,:)), max(X_normalized(2,:)), 20));
    x3 = -(w(1)*x1 + w(2)*x2 + b) / w(3);
    
    surf(x1, x2, x3, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
end

% Підписи до осей
xlabel('Ознака 1 (нормована)');
ylabel('Ознака 2 (нормована)');
zlabel('Ознака 3 (нормована)');
title('Класифікація тривимірних образів (Варіант 2)');
grid on;

% Створення умовних об'єктів для легенди
h0 = plot3(NaN, NaN, NaN, 'ro', 'MarkerFaceColor', 'r');
h1 = plot3(NaN, NaN, NaN, 'b+', 'LineWidth', 2);
hplane = plot3(NaN, NaN, NaN); % Пустий об'єкт для площини

legend([h0, h1, hplane], {'Клас 0', 'Клас 1', 'Розділяюча площина'}, 'Location', 'best');
