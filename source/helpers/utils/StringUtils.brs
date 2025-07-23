function StringIsEmpty(text as string) as boolean
  return len(text.trim()) = 0
end function

function IntToString(number as integer) as string
  s = Stri(number)
  return s.trim()
end function

function DoubleToString(number as double) as string
  s = Str(number)
  return s.trim()
end function

function FloatToString(number as float) as string
  s = Str(number)
  return s.trim()
end function

function ToStr(any as dynamic) as string
  ret = ToString(any)
  if ret = invalid ret = type(any)
  if ret = invalid ret = "NaS"
  return ret
end function

function StringEquals(str1 as dynamic, str2 as dynamic) as boolean
  return ToString(str1) = ToString(str2)
end function

function Stringtruncate(text as string, length as integer, ellipsis = "..." as string) as string
  truncated = ""
  if text.len() > length then
    truncated = left(text, length) + ellipsis
  else
    truncated = text
  end if
  return truncated
end function

function StringCapitalize(text as string) as string
  if text.len() > 1 then
    first = text.left(1)
    rest = text.mid(1)
    return uCase(first) + lCase(rest)
  end if
  return text
end function

function ManyStringCapitalize(text as string) as string
  stringArray = StringSplit(text, " ")
  finalText = ""

  for each word in stringArray
    finalText = finalText + StringCapitalize(word) + " "
  end for

  return finalText.Trim()
end function

function StringSplit(text as string, delim as string) as object
  regex = CreateObject("roRegex", delim, "")
  return regex.split(text)
end function

function StringContains(text as string, regex as string) as boolean
  roRegex = CreateObject("roRegex", regex, "")
  return roRegex.isMatch(text)
end function

function StringIndexOf(text as string, ch as string) as integer
  roRegex = CreateObject("roRegex", ch, "")

  if(not roRegex.isMatch(text)) then
    return -1
  end if

  res = roRegex.split(text)
  return len(res[0])
end function

function StringLastIndexOf(text as string, ch as string) as integer
  roRegex = CreateObject("roRegex", ch, "")

  if(not roRegex.isMatch(text)) then
    return -1
  end if

  res = roRegex.split(text)
  sum = 0

  for i = 0 to (res.count() - 2) step + 1
    sum = sum + len(res[i]) + 1
  end for
  return sum
end function

function StringJoin(arr as dynamic, delimeter = "" as string) as string
  if(not IsArray(arr)) then
    return ""
  end if

  result = ""
  for i = 0 to arr.count() - 1 step + 1
    el = arr[i]
    if(i = 0) then
      result = ToString(el)
    else
      result = result + delimeter + ToString(el)
    end if
  end for

  return result
end function

function StringToArray(text as string) as object
  arr = []
  if(StringIsEmpty(text)) then
    return arr
  end if

  for i = 0 to len(text) - 1 step + 1
    arr.push(text.mid(i, 1))
  end for

  return arr
end function

function StringReverse(text as string) as string
  if(StringIsEmpty(text)) then
    return text
  end if

  reversed = []
  arr = StringToArray(text)

  for i = arr.count() - 1 to 0 step -1
    reversed.push(arr[i])
  end for

  return StringJoin(reversed)
end function

function StringReplace(text as string, pattern as string, replacement as string) as string
  roRegex = CreateObject("roRegex", pattern, "")
  return roRegex.ReplaceAll(text, replacement)
end function

function ToString(any as dynamic) as string
  if any = invalid return "Invalid"
  if IsString(any) return any
  if IsInt(any) return IntToString(any)
  if IsBool(any)
    if any return "true"
    return "false"
  end if
  if IsFloat(any) then return FloatToString(any)
  if IsDouble(any) then return DoubleToString(any)

  if(IsArray(any)) then
    return "[" + StringJoin(any, ",") + "]"
  end if

  return type(any)
end function

function StringNormalize(text as string) as string
  charsWithAccent = ["á", "à", "â", "ã", "ä", "é", "è", "ê", "ë", "í", "ì", "î", "ï", "ó", "ò", "ô", "õ", "ö", "ú", "ù", "û", "ü", "ç", "Á", "À", "Â", "Ã", "Ä", "É", "È", "Ê", "Ë", "Í", "Ì", "Î", "Ï", "Ó", "Ò", "Ô", "Õ", "Ö", "Ú", "Ù", "Û", "Ü", "Ç"]
  charsWithoutAccent = ["a", "a", "a", "a", "a", "e", "e", "e", "e", "i", "i", "i", "i", "o", "o", "o", "o", "o", "u", "u", "u", "u", "c", "A", "A", "A", "A", "A", "E", "E", "E", "E", "I", "I", "I", "I", "O", "O", "O", "O", "O", "U", "U", "U", "U", "C"]

  normalized = text

  for i = 0 to charsWithAccent.Count() - 1
    normalized = normalized.Replace(charsWithAccent[i], charsWithoutAccent[i])
  end for

  normalized = StringReplace(normalized, "[^a-zA-Z0-9]", "-")

  return normalized
end function

function StringSlugify(text as dynamic) as string
  slug = LCase(ToString(text).Trim())

  slug = StringReplace(slug, "/\s+/g", "-")
  slug = StringReplace(slug, "/[^\w-]+/g", "")
  slug = StringReplace(slug, "/--+/g", "-")

  return StringNormalize(slug)
end function