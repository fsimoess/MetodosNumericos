clc;
clear;

syms x;

f = input('Entre com a função desejada: ', 's');
x0 = input('Entre com o x0: ');
x1 = input('Entre com o x1: ');
e = input('Entre com a tolerância desejada: ');
n = input('Entre com o n máximo: ');

while(n <= 0)
    fprintf('Entre com um n válido: \n');
    n = input;
end

erro = 99;
i = 0;

while(erro > e && i<n)
    f0 = subs(f,x0);
    f1 = subs(f,x1);
    
    x2 = (x0*f1 - x1*f0) / (f1 - f0);
        
    f2 = subs(f, x2);
    
    pause on;
    fplot(f, [x0, x1]);
    grid on;
    pause(3);
    
    fprintf('f(x0): %.4f | f(x1): %.4f | f(x2): %.4f | x0: %.4f | x1: %.4f | x2: %.4f\n', f0, f1, f2, x0, x1, x2);
    if (abs(f1) < e);
        fprintf('Solução encontrada pela imagem\n');
        disp(x2);
        return;
    end
    
    erro = abs(x1 - x0) / abs(x1);
    i=i+1;
    x0 = x1;
    x1 = x2;
end

if i>=n || erro < e
    fprintf('Solução não encontrada para n = %d\n', n);
else
    fprintf('Solução encontrada pelo dominio\n');
    disp(x1);
    return;
end


