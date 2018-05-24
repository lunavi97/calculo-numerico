function p = biseccion(a, b, f, E)
    cotaError = (b - a)/2
    p = a + cotaError
    while cotaError > E
        if(f(p) == 0) then
            return;
        elseif f(a) * f(p) < 0 then
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

function x = newtonRaphsonConNIteraciones(x0, f, fd, E, N)
    i = 1
    x = x0 - f(x0)/fd(x0)
    while abs(x - x0) > E & i < N
        x0 = x
        x = x0 - f(x0)/fd(x0)
        i = i + 1
    end
endfunction

function x = newtonRaphsonConIteracionesHastaErrorMenor(x0, a, b, f, fd, K, L, E)
    i = 1
    x = x0 - f(x0)/fd(x0)
    N = cantidadDeIteracionesNecesariasNewtonRaphson(a, b, K, L, E)
    while i < N
        x0 = x
        x = x0 - f(x0)/fd(x0)
        i = i + 1
    end
endfunction

function E = errorNewtonRaphsonEnNIteraciones(a, b, K, L, N)
    m = K/(2*L)
    E0 = b - a
    if m * E0 < 1 then
        E = (1/m) * (m * E0)^(2^N)
    end
endfunction

function E = errorNewtonRaphsonEnNIteracionesConM(a, b, m, N)
    E0 = b - a
    if m * E0 < 1 then
        E = (1/m) * (m * E0)^(2^N)
    end
endfunction

function N = cantidadDeIteracionesNecesariasNewtonRaphson(a, b, K, L, E)
    m = K/(2*L)
    E0 = b - a
    if m * E0 then
        N = ceil(log(log(E * m) / log(m * E0)) / log 2)
    end
endfunction

function n = cantidadDeIteracionesNecesariasNewtonRaphsonConM(a, b, m, E)
    E0 = b - a
    if m * E0 < 1 then
        N = ceil(log(log(E * m) / log(m * E0)) / log 2)
    end
endfunction


function b = puntoFijo(b0, g, E)
    b = g(b0)
    while abs(b - b0) > E
        b0 = b
        b = g(b0)
    end
endfunction
