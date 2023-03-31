return function(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      t1[k] = merge(t1[k], t2[k])
    else
      t1[k] = v
    end
  end

  return t1
end
