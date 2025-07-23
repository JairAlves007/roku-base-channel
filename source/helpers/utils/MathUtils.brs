function MathCeil(value as dynamic) as integer
  if(IsNumber(value) = false) then
    return 0
  end if

  if value - int(value) > 0 then
    return int(value) + 1
  else
    return int(value)
  end if
end function

function MathFloor(value as dynamic) as integer
  if(IsNumber(value) = false) then
    return 0
  end if

  return int(value)
end function

function MathRound(value as dynamic) as integer
  if(IsNumber(value) = false) then
    return 0
  end if

  if value - int(value) >= 0.5 then
    return int(value) + 1
  else
    return int(value)
  end if
end function