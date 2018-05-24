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

function x = newtonRaphson(x0, f, fd, E)
    x = x0 - f(x0)/fd(x0)
    while abs(x - x0) > E
        x0 = x
        x = x0 - f(x0)/fd(x0)
    end
endfunction

function b = puntoFijo(b0, g, E)
    b = g(b0)
    while abs(b - b0) > E
        b0 = b
        b = g(b0)
    end
endfunction
