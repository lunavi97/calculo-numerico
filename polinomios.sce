function Y = diferenciasDivididas(X, Y, N)
    for i = 1 : N
        for j = N + 1 : -1 : i + 1
            Y(j) = (Y(j) - Y(j - 1)) / (X(j) - X(j - i))
        end
    end
endfunction

function y = horner(X, d, x, N)
    y = d(N + 1)
    for i = N : -1 : 1
        y = d(i) + y * (x - X(i))
    end
endfunction
