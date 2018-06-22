function T = euler(t, y, f, h, N)
    T = [t y]
    for i = 1 : N
        y = y + f(t, y) * h
        t = t + h
        T = [T; t y]
    end
endfunction

function N = cantidadDeIteraciones(t0, tf, h)
    N = (tf - t0) / h
endfunction

function h = cantidadDePasos(t0, tf, N)
    h = (tf - t0) / n
endfunction
