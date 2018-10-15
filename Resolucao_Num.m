clc;
clear;
format short;

mat = input('Entre com a matriz A desejada: ');
b = input('Entre com a matriz B desejada: ');
[n, c] = size(mat);
m = eye(n);
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

%m1 = [m b];
%y(n) = m1(n, n+1)/m1(n,n);
 %for i=(n-1):-1:1
    %soma = 0;
    %for j=i+1:n
    %    soma = soma + m1(i, j)*y(j);
   % end
  %  y(i)=(m1(i,n+1)-soma)/m1(i,i);
 %end

m2 = [mat y];
x(n) = m2(n, n+1)/m2(n,n);
 for i=(n-1):-1:1
    soma = 0;
    for j=i+1:n
        soma = soma + m2(i, j)*x(j);
    end
    x(i)=(m2(i,n+1)-soma)/m2(i,i);
end

fprintf('Os valores de X são:\n');
disp(x);
