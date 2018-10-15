clc;
clear;
format short;

x = input('Entre com o vetor X: ');
y = input('Entre com o vetor Y: ');
n = length(x);

m = input('Entre com o grau do polinômio: ');

A = zeros(m+1,m+1);
b = zeros(m+1, 1);

for i=1:(m+1)
    p = 2*m - (i-1);
    for j=1:(m+1)
        A(i,j) = sum(x.^p);
        p = p-1;
    end
end

p=m;
for i=1:(m+1)
    b(i) = sum(y.*(x.^p)); 
    p = p-1;
end

mat = [A b];

for j=1:(m+1)
    if mat(j,j) == 0
        maior=0;
        for z=(j+1):n
            if mat(z,j) > maior
                maior = abs(mat(z,j));
                l = z; %Guarda linha do maior elemento.
            end
        end
        if maior == 0
            fprintf('Determinante da matriz é 0, fim do programa\n');
            return;
        else
            mat([j l],:) = mat([l j],:);
        end
    end
    
    for i=j+1:(m+1)
        me = mat(i, j)/mat(j, j);
        mat(i, :) = mat(i, :) - me*mat(j, :);
    end
end

sol(m+1) = mat(m+1,m+2)/mat(m+1,m+1);
soma = 0;
 for i=m:-1:1
    soma = 0;
    for j=i+1:(m+1)
        soma = soma + mat(i, j)*sol(j);
    end
    sol(i)=(mat(i,m+1)-soma)/mat(i,i);
 end

sol = num2str(sol);


