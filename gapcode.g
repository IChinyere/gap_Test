#Finding the average order of an element in a group G


AvgOrd:=function ( G )
    local sum, g;
    sum := 0;
    for g in G do
        sum := sum + Order( g );
    od;
    return sum / Size( G );
end;



double:=function(x)
	return 2*x;
end;


