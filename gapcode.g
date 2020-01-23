#Finding the average order of an element in a group G


AvgOrd:=function ( G )
    local sum, g;
    sum := 0;
    for g in G do
        sum := sum + Order( g );
    od;
    return sum / Size( G );
end;

#Multiplying a real number by 2

double:=function(x)
	return 2*x;
end;

#This code outputs a cyclic presentation P_n(w). It takes inputs the number of generators n and a list L of integers
#For example L=[1,2,3] means that w=x_1*x_2*x_3. On the other hand L=[1,2,-3] means that w=x_1*x_2*x_3^-1.
CycPresGroup:=function(n,L)
     local rels,j;
     F := FreeGroup(n);
     x := GeneratorsOfGroup(F);
     w:=x[AbsInt(L[1])]^(L[1]/AbsInt(L[1]));; j := 1;;
     while j < Length(L) do
     	j:=j+1;
     	w:=w*x[AbsInt(L[j])]^(L[j]/AbsInt(L[j]));
     od;
     rels := List(AsList(CyclicGroup(IsPermGroup,n)),g->MappedWord(w,x,Permuted(x,g)));
     return(F/rels);
end;

#n must be even and at least 8

#This creates the element Elta
Elta:=function(G,n)
local i,y,a;
y:= GeneratorsOfGroup(G);
a:=y[n-1];; i := 1;;
while i < n/2 do
	i:=i+1;
    a:=a*y[n+1-2*i];
od;
    return a;
end;

#This creates the element Eltb
Eltb:=function(G,n)
local i,b,y,J;
y:= GeneratorsOfGroup(G);
b:=y[n/2+2]*y[n/2]*y[4]*y[2];; i :=0;;
while i < (n/GcdInt(n,4))-1 do
     	i:=i+1;
     	J:=[(n/2+2+4*i) mod n, (n/2+4*i) mod n, (4+4*i) mod n,(2+4*i) mod n];
     	for g in [1,2,3,4] do
     		if J[g]= 0 then
     			J[g]:=n;
     		else
     		fi;
     		
     	od;
     			
     	b:=b*y[J[1]]*y[J[2]]*y[J[3]]*y[J[4]];
     od;
    return b;
end;


