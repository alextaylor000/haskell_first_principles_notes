def no_empty(str)
  !str.empty?
end

def no_negative(num)
  num > 0
end

def weight_check(hash)
  hash[:name] != "Bess" || hash[:weight] > 499
end

def make_cow(name, age, weight)
  return unless no_empty(name)
  return unless no_negative(age)
  return unless no_negative(weight)
  return unless weight_check({name: name, weight: weight})

  { name: name, weight: weight, age: age }
end
