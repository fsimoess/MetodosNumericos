clear;
clc;

f = input('Digite a funcao desejada: ', 's');
a = input('Digite o limite inferior desejado: ');
b = input('Digite o limite superior desejado: ');
e = input('Digite o erro desejado: ');

while(a > b)
    fprintf('Entre com valores válidos para o limite inferior e superior\n');
    a = input('Digite o limite inferior desejado: ');
    b = input('Digite o limite superior desejado: ');
end

fa = subs(f,a);
fb = subs(f,b);

if fa*fb > 0
    while(true)
        fprintf('Entre com valores válidos para o limite inferior e superior\n');
        a = input('Digite o limite inferior desejado: ');
        b = input('Digite o limite superior desejado: ');
        fa = subs(f,a);
        fb = subs(f,b);
        break;
    end
elseif fa*fb == 0
     if fa == 0
        fprintf('O limite inferior é a solução');
        disp(a);
        return;
     elseif fb == 0
            fprintf('O limite superior é a solução');
            disp(b);
            return;
     end
end

intervalo = abs(b-a);

while intervalo > e
    x = (a*fb - b*fa)/(fb-fa);
    fx = subs(f,x);
    pause on;
    fplot(f, [a,b]);
    grid on;
    pause(3);
    fprintf('f(a): %f | f(b): %f | x: %f | f(x): %f\n', fa, fb, x, fx);
    if abs(fx) < e
        fprintf('A solução foi encontrada.');
        disp(x);
        return;
    end
    
    if fa*fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    
    intervalo = abs(b-a);
end 

fprintf('A solução foi encontrada.');
disp(x);
