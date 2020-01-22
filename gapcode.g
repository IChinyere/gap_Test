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
     local rels,s;
     F := FreeGroup(n);
     x := GeneratorsOfGroup(F);
     w:=x[AbsInt(L[1])]^(L[1]/AbsInt(L[1]));; s := 1;;
     while s < Length(L) do
     	s:=s+1;
     	w:=w*x[AbsInt(L[s])]^(L[s]/AbsInt(L[s]));
     od;
     rels := List(AsList(CyclicGroup(IsPermGroup,n)),g->MappedWord(w,x,Permuted(x,g)));
     return(F/rels);
end;



