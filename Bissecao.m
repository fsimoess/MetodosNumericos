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
    pm = (a+b)/2;
    fpm = subs(f, pm);
    pause on;
    fplot(f, [a,b]);
    grid on;
    pause(3);
    fprintf('f(a): %f | f(b): %f | pm: %f | f(pm): %f\n', fa, fb, pm, fpm);
    if abs(fpm) < e
        fprintf('A solução foi encontrada.');
        disp(pm);
        return;
    end
    
    if fa*fpm < 0
        b = pm;
        fb = fpm;
    else
        a = pm;
        fa = fpm;
    end
    
    intervalo = abs(b-a);
end 

fprintf('A solução foi encontrada.');
disp(pm);
