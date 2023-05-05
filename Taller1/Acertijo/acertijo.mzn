%Acertijo Lógico

include "globals.mzn";

%Variables

%music
var 1..3: clasica;
var 1..3: pop;
var 1..3: jazz;

%age
var 1..3: veinticuatro; 
var 1..3: veinticinco; 
var 1..3: veintiseis; 

%first_name
var 1..3: juan;
var 1..3: oscar;
var 1..3: dario;

%last_name
var 1..3: lopez; 
var 1..3: gonzalez; 
var 1..3: garcia; 


%Restricciones

constraint all_different([clasica, pop, jazz]);
constraint all_different([veinticuatro, veinticinco, veintiseis]);
constraint all_different([juan, oscar, dario]);
constraint all_different([lopez, gonzalez, garcia]);

%Juan es más viejo que González, a quien le gusta la música clásica.
constraint juan = gonzalez + 1;
constraint gonzalez = clasica;
%El fan de la música pop, que no es García, no tiene 24.
constraint pop != garcia;
constraint pop != veinticuatro;
%Oscar, quien no es López, tiene 25.
constraint oscar != lopez;
constraint oscar = veinticinco;
%La música favorita de Darío no es el jazz.
constraint dario != jazz;

solve satisfy;

output 
[
"music         :  \([clasica, pop, jazz]) \n" ++
"age           : \([veinticuatro, veinticinco, veintiseis]) \n" ++
"first name    :  \([juan, oscar, dario]) \n" ++
"last name     : \([lopez, gonzalez, garcia])++ \n"];
