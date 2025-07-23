sub SetSceneBackgroundColor(backgroundColor as string)
  m.top.GetScene().backgroundUri = ""
  m.top.GetScene().backgroundColor = backgroundColor
end sub

function GetColorImage(color = "transparent" as string) as string
  baseURL = "pkg:/images/colors/"
  if color = "transparent" then return baseURL + "transparent.png"

  return baseURL + LCase(color.Replace("#", "")) + ".png"
end function

sub AddBorders(element as object, borderSize as integer, borderColor as string)
  elementRect = element.BoundingRect()

  borderTop = element.CreateChild("Rectangle")
  borderTop.width = elementRect.width
  borderTop.height = borderSize
  borderTop.translation = [0, 0]
  borderTop.color = borderColor

  borderBottom = element.CreateChild("Rectangle")
  borderBottom.width = elementRect.width
  borderBottom.height = borderSize
  borderBottom.translation = [0, elementRect.height - borderBottom.height]
  borderBottom.color = borderColor

  borderLeft = element.CreateChild("Rectangle")
  borderLeft.width = borderSize
  borderLeft.height = elementRect.height
  borderLeft.translation = [0, 0]
  borderLeft.color = borderColor

  borderRight = element.CreateChild("Rectangle")
  borderRight.width = borderSize
  borderRight.height = elementRect.height
  borderRight.translation = [elementRect.width - borderRight.width, 0]
  borderRight.color = borderColor
end sub

function IsConnectedOnNetwork() as boolean
  deviceInfo = CreateObject("roDeviceInfo")

  return deviceInfo.GetLinkStatus()
end function

sub RunTask(taskObject as object, functionName as string)
  taskObject.functionName = functionName
  taskObject.control = "run"
end sub

function FormatRequest(requestObject as object) as string
  keys = requestObject.Keys()
  request = "?"

  for each key in keys
    request = request + key + "=" + requestObject.Lookup(key) + "&"
  end for

  return Left(request, Len(request) - 1)
end function

function IsDeepLinking() as boolean
  return m.global.deepLinkingArgs <> invalid
end function

sub CancelDeepLinking()
  m.global.Update({
    deepLinkingArgs: invalid
  }, true)
end sub

function GetDeepLinkingArgs() as object
  return m.global.deepLinkingArgs
end function

sub FireSignalBeacon(signal as string)
  m.top.GetScene().SignalBeacon(signal)
end sub