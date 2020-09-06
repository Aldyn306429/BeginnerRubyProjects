# frozen_string_literal: true

# Iterative solution
def fibs(number)
  return [] if number <= 0
  return [0] if number == 1

  arr = [0, 1]
  2.upto(number - 1) do
    arr.push(arr[-2] + arr[-1])
  end
  arr
end

# Recussive solution
def fibs_rec(number)
  return [] if number <= 0
  return [0] if number == 1
  return [0, 1] if number == 2

  temp_arr = fibs_rec(number - 1)
  temp_arr.push(temp_arr[-1] + temp_arr[-2])
  temp_arr
end

p fibs(12)
p fibs_rec(12)
