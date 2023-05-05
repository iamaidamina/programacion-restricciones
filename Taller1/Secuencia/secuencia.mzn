%Secuencia Mágica

%Parametros
int: n; %longitud de la secuencia 

%Variables
set of int: N = 0..n-1;
array[N] of var N: x;%valores de la secuencia

%Restricciones
%Basicas
constraint forall(i in N)( x[i] = count(j in N)(x[j]=i));%PONER NOMBRE
constraint forall(i in N)(x[i] >= 0);
%Redundantes
constraint(sum(i in N)(x[i]) = n );%PONER NOMBRE
constraint(sum(i in N)( (i-1)*x[i]) = 0 );%PONER NOMBRE

solve satisfy;
output["Secuencia magica: \(x)"];
%output["[ "];
%output [show_int(i in N,x[i]) ++
%if i == n-1 then " ]" else ", " endif |
%i in N
%];

