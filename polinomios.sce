function Y = diferenciasDivididas(X, Y, N)
    for i = 1 : N
        for j = N + 1 : -1 : i + 1
            Y(j) = (Y(j) - Y(j - 1)) / (X(j) - X(j - i))
        end
    end
endfunction
