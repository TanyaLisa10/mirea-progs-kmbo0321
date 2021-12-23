x, y = 0, 0

function move_to_border(f, r, side, dif = 0)
    res = 0
    while !isborder(r, side)
        f(r)
        move!(r, side)
        res += dif
    end
    return res
end

function fill_line(r)
    move_to_border(putmarker!, r, Ost)
    putmarker!(r)
    f(x) = nothing
    move_to_border(f, r, West)
end

function fill_all(r)
    global x, y
    f(l) = nothing
    x += move_to_border(f, r, Nord, -1)
    y += move_to_border(f, r, West, -1)
    x += move_to_border(fill_line, r, Sud, 1)
    fill_line(r)
end

fill_all(r)

for i in (1:abs(x))
    move!(r, Nord)
end
for i in (1:abs(y))
    move!(r, Ost)
end
show(r)