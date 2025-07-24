function GetContent() as object
  colors = [
    "#C5C5C5"
    "#555555"
    "#3A4044"
    "#7A7A7A"
    "#1E1E22"
    "#0C0C0C"
    "#1A1A1C"
    "#FFDAD5"
    "#FFB4AA"
    "#B72600"
    "#541100"
    "#A4A4A4"
    "#FAFAFA"
    "#424242"
    "#2DA01B"
    "#ECD930"
    "#DDAE4A"
  ]
  content = CreateObject("roSGNode", "ContentNode")

  row = content.CreateChild("ContentNode")
  row.title = "Colors"

  for each color in colors
    item = row.CreateChild("ContentNode")

    item.Update({
      highlight: GetColorImage(color),
    }, true)
  end for

  return content
end function

sub OnBackScreenButtonSelected()
  m.top.backScreen = true
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
  handled = false

  if press and m.top.visible then
    navigation = SetTwoDirectionsNavigation(m.focusableChildren, m.navigationXIndex, m.navigationYIndex, key)

    m.navigationXIndex = navigation.navigationXIndex
    m.navigationYIndex = navigation.navigationYIndex
  end if

  return handled
end function