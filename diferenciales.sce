function T = euler(t, y, f, h, N)
    T = [t y]
    for i = 1 : N
        y = y + f(t, y) * h
        t = t + h
        T = [T; t y]
    end
endfunction

function X1 = jacobi(X, A, B, M, N)
    for i = 1 : M
        for j = 1 : N
            S = 0
            for k = 1 : j - 1
                S = S + A(j, k) * X(k)
            end
            for k = j + 1 : N
                S = S + A(j, k) * X(k)
            end
            X1(j) = (B(j) - S) / A(j, j)
        end
    end
endfunction

function N = cantidadDeIteraciones(t0, tf, h)
    N = (tf - t0) / h
endfunction

function h = cantidadDePasos(t0, tf, N)
    h = (tf - t0) / N
endfunction
