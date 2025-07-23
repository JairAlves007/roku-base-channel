function RandomNextInteger() as integer
  return rnd(2147483647)
end function

function RandomNextFloat() as float
  return rnd(0)
end function

function RandomNextString(length = 20 as integer) as string
  randomString = ""

  for i = 1 to length step + 1
    randomString = randomString + Constants().CHARS.mid(rnd(62) - 1, 1)
  end for

  return randomString
end function

function RandomNextHexString(length = 6 as integer) as string
  randomString = ""

  for i = 1 to length step + 1
    randomString = randomString + Constants().HEXCHARS.mid(rnd(16) - 1, 1)
  end for

  return randomString
end function

function GenerateUUID() as string
  arr = [
    RandomNextHexString(8),
    RandomNextHexString(4),
    RandomNextHexString(4),
    RandomNextHexString(4),
    RandomNextHexString(12)
  ]
  return StringJoin(arr, "-")
end function