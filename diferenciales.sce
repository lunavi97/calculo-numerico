function T = euler(t, y, f, h, N)
    T = [t y]
    for i = 1 : N
        y = y + f(t, y) * h
        t = t + h
        T = [T; t y]
    end
endfunction
