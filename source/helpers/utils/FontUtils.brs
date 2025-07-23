function GetFontDefaultConfig() as object
  fontDefaultConfig = {
    large: {
      default: "font:LargeSystemFont"
      bold: "font:LargeBoldSystemFont"
    }
    medium: {
      default: "font:MediumSystemFont"
      bold: "font:MediumBoldSystemFont"
    }
    small: {
      default: "font:SmallSystemFont"
      bold: "font:SmallBoldSystemFont"
    }
    smallest: {
      default: "font:SmallestSystemFont"
      bold: "font:SmallestBoldSystemFont"
    }
  }
  return fontDefaultConfig
end function

function CreateFont(fontFamily as string, weight as string, size as integer) as object
  styleGuide = m.global.styleGuide
  searchFont = styleGuide.fonts[fontFamily]

  if searchFont <> invalid or searchFont[weight] <> invalid
    font = CreateObject("roSGNode", "Font")
    font.uri = searchFont[weight]
    font.size = size

    return font
  end if

  fontSize = styleGuide.fontSizes
  fontDefaultConfig = GetFontDefaultConfig()

  if size < fontSize.small then
    fontObj = fontDefaultConfig.smallest
  else if size < fontSize.medium then
    fontObj = fontDefaultConfig.small
  else if size < fontSize.large then
    fontObj = fontDefaultConfig.medium
  else
    fontObj = fontDefaultConfig.large
  end if

  if weight = "bold" or weight = "black" then font = fontObj.bold else font = fontObj.default
end function