function p = biseccion(a, b, f, E)
    cotaError = (b - a)/2
    p = a + cotaError
    while cotaError > E
        if(f(p) == 0)
            return;
        elseif(f(a) * f(p) < 0)
            b = p
        else
            a = p
        end
        cotaError = cotaError/2
        p = a + cotaError
    end
endfunction
