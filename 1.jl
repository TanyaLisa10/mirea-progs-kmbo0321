function inverse(side)
  return HorizonSide(mod(Int(side) + 2, 4))
end

function go_to(rob, side)
  a = 0
  while !isborder(rob, side)
      putmarker!(rob)
      move!(rob, side)
      a+=1
  end
  putmarker!(rob)
  for i in (1:a)
      move!(rob, inverse(side))
  end
end

for i in (0:3)
  go_to(r, HorizonSide(i))
end

show(r)