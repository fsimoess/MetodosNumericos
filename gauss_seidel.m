clc;
clear;
format short;

A = input('Entre com a matriz A desejada: ');
b = input('Entre com a matriz B desejada: ');
nMax = input('Entre com o nMax desejada: ');
erro = input('Entre com a tolerância desejada: ');
x0 = input('Entre com o vetor inicial: ');

g=b;
[n, m] = size(A);

for i=1:n
    for j=1:n
        if (i==j)
            A(i,j) = 1000*A(i,j);
        end
    end
end

for i=1:n
    g(i) = b(i)/A(i,i);
    for j=1:n
        if (i==j)
            C(i,j) = 0;
        else
            C(i,j) = -A(i,j)/A(i,i);
        end
    end
end

beta = [];
soma = 0;
for j=2:n
    soma = soma + abs(C(1,j));
end
beta(1) = soma;

for i=2:n
    soma1=0;
    soma2=0;
    for j=1:(i-1)
        soma1 = soma1 + (abs(C(i,j)) * beta(j));
    end
    for j=(i+1):n
        soma2 = soma2 + abs(C(i,j));
    end
    beta(i) = soma1+soma2;
end

mBeta = max(beta);

if mBeta >= 1
    fprintf('Não há garantia de convergência');
    return;
end

num = 0;
x1 = x0;

N = tril(-C, -1);
M = triu(-C, -1);

while num<nMax
    x0 = x1;
    for i=1:n
        soma=0;
        for j=1:n
            if i==j || i<j
                soma = soma + C(i,j)*x0(j);
            else
                soma = soma + C(i,j)*x1(j);
            end
        end
        x1(i) = soma + g(i);
    end
    
    e = norm(x0-x1, Inf)/norm(x1, Inf);
    
    if e < erro
        disp(x1);
        return;
    end
    
    
    num = num+1;
end

disp(x1);