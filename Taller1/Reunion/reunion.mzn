include "globals.mzn";

% Ubicación de personas en reunión

%Cargar datos:
array[int] of string: personas;
array[int, int] of int: next;
array[int, int] of int: separate;
array[int, int] of int: distance;

%Parametros

int: N = length(personas);

%Variables
array[1..N] of var 1..N: A;

%Restricciones
%Basicas
constraint all_different(A);
constraint forall(i,j in 1..N where (A[i]=next[1,1] /\ A[j]=next[1,2]))(abs(i-j) = 1);
constraint forall(i,j in 1..N where (A[i]=separate[1,1] /\ A[j]=separate[1,2]))(abs(i-j) > 1);
constraint forall(i,j in 1..N where A[i]=distance[1,1]  /\ A[j]=distance[1,2]  )(abs(i-j) <= distance[1,3] +1);
%Redundantes
constraint (sum(i in 1..N)(A[i]) = (((N)*(N+1))/2));

solve satisfy;
output["Ubicación de personas en foto: \(A)"];


