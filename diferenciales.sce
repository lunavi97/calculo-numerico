function T = euler(t, y, f, h, N)
    T = [t y]
    for i = 1 : N
        y = y + f(t, y) * h
        t = t + h
        T = [T; t y]
    end
endfunction

function T = taylor2(t, y, N, h, f, df)
    T = [t y]
    for i = 1 : N
        y = y + h * (f(t, y) + 0.5 * df(t, y) * h)
        t = t + h
        T = [T; t y]
    end
endfunction

function T = rungeKutta2(t, y, h, f, N)
    T = [t y]
    for i = 1 : N
        k1 = f(t, y) * h
        t = t + h
        k2 = f(t, y - k1) * h
        y = y + (k1 + k2) / 2
        T = [T; t y]
    end
endfunction

function T = rungeKutta4(t, y, h, f, N)
    T = [t y]
    for i = 1 : N
        k1 = f(t, y) * h
        k2 = f(t + h/2, y + k1/2) * h
        k3 = f(t + h/2, y + k2/2) * h
        t = t + h
        k4 = f(t, y + k3)
        y = y + (k1 + 2 * (k2 + k3) + k4) / 6
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

function X = seidel(X, A, B, M, N)
    for i = 1 : M
        for j = 1 : N
            S = 0
            for k = 1 : j - 1
                S = S + A(j, k) * X(k)
            end
            for k = j + 1 : N
                S = S + A(j, k) * X(k)
            end
            X(j) = (B(j) - S) / A(j, j)
        end
    end
endfunction

function N = cantidadDeIteraciones(t0, tf, h)
    N = (tf - t0) / h
endfunction

function h = cantidadDePasos(t0, tf, N)
    h = (tf - t0) / N
endfunction
