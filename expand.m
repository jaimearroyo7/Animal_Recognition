function contorn = expand(contorn, x, y)
    [filas, cols] = size(contorn);
    contorn(x,y) = 1;
    if x > 1
        if contorn(x-1,y) == 0
            contorn = expand(contorn, x-1, y);            
        end
    end
    if x < filas
        if contorn(x+1,y) == 0
            contorn = expand(contorn, x+1, y);           
        end
    end
    if y > 1
        if contorn(x,y-1) == 0
            contorn = expand(contorn, x, y-1);            
        end
    end
    if y < cols
        if contorn(x,y+1) == 0
            contorn = expand(contorn, x, y+1);            
        end
    end
end