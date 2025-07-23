function IsString(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifString") = invalid return false
  return true
end function

function IsBool(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifBoolean") = invalid return false
  return true
end function

function IsBoolean(obj as dynamic) as boolean
  return IsBool(obj)
end function

function IsInt(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifInt") = invalid return false
  return true
end function

function IsInteger(obj as dynamic) as boolean
  return IsInt(obj)
end function

function IsArray(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifArray") = invalid return false
  return true
end function

function IsList(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifList") = invalid return false
  return true
end function

function IsFloat(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifFloat") = invalid return false
  return true
end function

function IsDouble(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifDouble") = invalid return false
  return true
end function

function IsComparable(obj as dynamic) as boolean
  if (obj = invalid) then return true
  if (IsString(obj)) then return true
  if (IsBool(obj)) then return true
  if (IsInt(obj)) then return true
  if (IsFloat(obj)) then return true
  if (IsDouble(obj)) then return true
  return false
end function

function IsNumber(obj as dynamic) as boolean
  if (IsInt(obj)) then return true
  if (IsFloat(obj)) then return true
  if (IsDouble(obj)) then return true
  return false
end function

function IsDateTime(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifDateTime") = invalid return false
  return true
end function

function IsObject(obj as dynamic) as boolean
  if obj = invalid return false
  if getInterface(obj, "ifAssociativeArray") = invalid return false
  return true
end function

function BooleanToInteger(value as boolean) as integer
  if value then return 1 else return 0
end function

function IsEmailAddress(email as string) as boolean
  expression = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}"
  regex = CreateObject("roRegex", expression, "i")

  return regex.IsMatch(email)
end function