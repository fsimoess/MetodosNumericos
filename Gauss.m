clc;
clear;
format short;

A = input('Entre com a matriz A desejada: ');
b = input('Entre com a matriz B desejada: ');
mat = [A b];
[n, c] = size(A);
cont=0;

for j=1:n
    if mat(j,j) == 0
        maior=0;
        for x=(j+1):n
            if mat(x,j) > maior
                maior = abs(mat(x,j));
                l = x; %Guarda linha do maior elemento.
            end
        end
        if maior == 0
            fprintf('Determinante da matriz é 0, fim do programa\n');
            return;
        else
            mat([j l],:) = mat([l j],:);
        end
    end
    
    for i=j+1:n
        m(i,j) = mat(i, j)/mat(j, j);
        mat(i, :) = mat(i, :) - m(i,j)*mat(j, :);
        cont=cont+1;
        fprintf('A matriz ao fim do %d passo é: \n', cont);
        disp(mat);
    end
end

x(n) = mat(n, n+1)/mat(n,n);
soma = 0;
 for i=(n-1):-1:1
    soma = 0;
    for j=i+1:n
        soma = soma + mat(i, j)*x(j);
    end
    x(i)=(mat(i,n+1)-soma)/mat(i,i);
end

fprintf('Os valores de X são:\n');
disp(x);
