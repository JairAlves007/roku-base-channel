function ArrayEquals(arr1 as dynamic, arr2 as dynamic) as boolean
  if(not IsArray(arr1)) then
    return false
  end if

  if(not IsArray(arr2)) then
    return false
  end if

  if(arr1.count() <> arr2.count()) then
    return false
  end if

  for i = 0 to arr1.count() - 1 step + 1
    if(arr1[i] <> arr2[i]) then
      return false
    end if
  end for

  return true
end function

function ArrayIsEmpty(arr as dynamic) as boolean
  if(arr = invalid) then
    return true
  end if

  return arr.count() = 0
end function

function ArrayContains(arr as dynamic, element as dynamic) as boolean
  return ArrayIndexOf(arr, element) >= 0
end function

function ArrayIndexOf(arr as dynamic, element as dynamic) as integer
  if(not IsArray(arr)) then
    return -1
  end if

  if(ArrayIsEmpty(arr)) then
    return -1
  end if

  if(not IsComparable(element)) then
    return -1
  end if

  for i = 0 to arr.count() - 1 step + 1
    if(arr[i] = element) then
      return i
    end if
  end for

  return -1
end function

function ArrayAdd(arr as dynamic, index as integer, element as dynamic) as dynamic
  if(IsArray(arr) = false) then
    return invalid
  end if

  if(index < 0) then
    return arr
  end if

  if(ArrayIsEmpty(arr)) then
    return [element]
  end if

  if(index = arr.count()) then
    arr.push(element)
    return arr
  end if

  if(index = 0) then
    arr.unshift(element)
    return arr
  end if

  if(index > arr.count() + 1) then
    return arr
  end if

  newArray = []
  for i = 0 to arr.count() - 1 step + 1
    if(index = i) then
      newArray.push(element)
    end if
    newArray.push(arr[i])
  end for

  return newArray
end function

function ArrayReplace(arr as dynamic, index as integer, element as dynamic) as dynamic
  if(IsArray(arr) = false) then
    return invalid
  end if

  if(index < 0) then
    return arr
  end if

  if(ArrayIsEmpty(arr)) then
    return []
  end if

  if(index > arr.count() - 1) then
    return arr
  end if

  newArray = []
  for i = 0 to arr.count() - 1 step + 1
    if(index = i) then
      newArray.push(element)
    else
      newArray.push(arr[i])
    end if
  end for

  return newArray
end function

function ArraySubArray(arr as dynamic, startIndex as integer, endIndex as integer) as dynamic
  if(ArrayIsEmpty(arr)) then
    return []
  end if

  if(startIndex < 0) then
    startIndex = 0
  end if

  if(endIndex > arr.count() - 1) then
    endIndex = arr.count() - 1
  end if

  if(startIndex > endIndex) then
    return invalid
  end if

  newArray = []
  for i = startIndex to endIndex step + 1
    newArray.push(arr[i])
  end for

  return newArray
end function

function ArrayToString(arr as dynamic) as string
  return ToString(arr)
end function

function ArrayMax(arr as dynamic) as dynamic
  max = arr[0]

  if(IsNumber(max) = false) then
    return invalid
  end if

  if(ArrayIsEmpty(arr)) then
    return invalid
  end if

  for each el in arr
    if(el > max) then
      max = el
    end if
  end for

  return max
end function

function ArrayMin(arr as dynamic) as dynamic
  min = arr[0]

  if(IsNumber(min) = false) then
    return invalid
  end if

  if(ArrayIsEmpty(arr)) then
    return invalid
  end if

  for each el in arr
    if(el < min) then
      min = el
    end if
  end for

  return min
end function

function ArrayPluckItemsByField(items as object, field as string) as object
  arrayPlucked = []

  if items = invalid or items.Count() <= 0 then return arrayPlucked

  for each item in items
    arrayPlucked.push(item[field])
  end for

  return arrayPlucked
end function

function ArrayFilter(arr as object, condition as function) as object
  filteredArray = []

  for each item in arr
    if condition(item)
      filteredArray.push(item)
    end if
  end for

  return filteredArray
end function

function ArrayFind(arr as object, condition as function) as object
  for each item in arr
    if condition(item) return item
  end for

  return invalid
end function

function ArrayWhereItemByField(items as object, value as dynamic, field = "id" as string) as object
  for i = 0 to items.Count() - 1
    item = items[i]

    if ToString(item[field]) = ToString(value) then
      return item
    end if
  end for

  return invalid
end function

function ArrayWhereIndexOfByField(items as object, value as dynamic, field = "id" as string) as integer
  for i = 0 to items.Count() - 1
    item = items[i]

    if LCase(ToString(item[field])) = LCase(ToString(value)) then
      return i
    end if
  end for

  return -1
end function