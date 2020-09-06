# frozen_string_literal: true

def merge_sort(array)
  return array if array.length < 2

  merge(merge_sort(array[0..array.length / 2 - 1]), merge_sort(array[array.length / 2..array.length - 1]))
end

def merge(arr1, arr2)
  result = []

  until arr1.empty? || arr2.empty?
    if arr1[0] <= arr2[0]
      result.push(arr1[0])
      arr1.delete_at(0)
    else
      result.push(arr2[0])
      arr2.delete_at(0)
    end
  end

  until arr1.empty?
    result.push(arr1[0])
    arr1.delete_at(0)
  end

  until arr2.empty?
    result.push(arr2[0])
    arr2.delete_at(0)
  end

  result
end

array_to_be_sorted = [1, 4, 6, 7, 9, 5, 3, 7]
p merge_sort(array_to_be_sorted)
