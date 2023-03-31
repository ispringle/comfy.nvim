function merge(initial, changes)
  for k, v in pairs(changes) do
    if type(v) == "table" and v ~= {} then
      initial[k] = merge(initial[k] or {}, changes[k])
    else
      initial[k] = v
    end
  end

  return initial
end

return merge
