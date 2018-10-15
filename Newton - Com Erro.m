clc;
clear;

syms x;

f = input('Entre com a fun��o desejada: ', 's');
x0 = input('Entre com o x0: ');
e = input('Entre com a toler�ncia desejada: ');
n = input('Entre com o n m�ximo: ');

while(n <= 0)
    fprintf('Entre com um n v�lido: \n');
    n = input;
end

erro = 99;
i = 0;

while(erro > e && i<n)
    f0 = subs(f,x0);
    df = diff(f, x);
    dx = subs(df, x0);
    x1 = x0 - f0/(dx);
    f1 = subs(f, x1);
    
    %pause on;
    %fplot(f, [x0-5, x0+5]);
    %grid on;
    %pause(3);
    
    fprintf('f(x0): %.4f | f(x1): %.4f | f�(x0): %.4f | x0: %.4f | x1: %.4f\n', f0, f1, dx, x0, x1);
    if (abs(f1) < e);
        fprintf('Solu��o encontrada pela imagem\n');
        disp(x1);
        return;
    end
    
    erro = abs(x1 - x0) / abs(x1);
    i=i+1;
    x0 = x1;
end

if i>=n || erro < e
    fprintf('Solu��o n�o encontrada para n = %d\n', n);
else
    fprintf('Solu��o encontrada pelo dominio\n');
    disp(x1);
    return;
end


