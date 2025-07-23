function GetAppVersion() as string
  majorVersion = "0"
  minorVersion = "0"
  buildVersion = "0"

  file = ReadAsciiFile("pkg:/manifest")
  rows = file.tokenize(chr(10))

  for each row in rows
    row = row.trim()

    if len(row) > 0 then
      keyValue = row.tokenize("=")

      if keyValue.count() > 1 then
        key = keyValue[0]
        value = keyValue[1]

        if key = "major_version" then
          majorVersion = value
        else if key = "minor_version" then
          minorVersion = value
        else if key = "build_version" then
          buildVersion = value
        end if
      end if
    end if
  end for
  return majorVersion + "." + minorVersion + "." + buildVersion
end function

function GetResolution() as string
  return m.top.GetScene().currentDesignResolution.resolution
end function

function GetResolutionSizes() as object
  currentDesignResolution = m.top.GetScene().currentDesignResolution

  return {
    width: currentDesignResolution.width,
    height: currentDesignResolution.height
  }
end function

function WrongDeviceScreenResolution() as boolean
  deviceInfo = CreateObject("roDeviceInfo")
  realDeviceResolution = deviceInfo.GetUIResolution()
  manifestResolutionSize = GetResolutionSizes()

  return realDeviceResolution.width <> manifestResolutionSize.width or realDeviceResolution.height <> manifestResolutionSize.height
end function

function FixValueBasedInUIResolution(value as integer) as integer
  needFixValueBasedInResolution = WrongDeviceScreenResolution()

  if needFixValueBasedInResolution then
    resolutionFix = 2 / 3

    value = value * resolutionFix
  end if

  return value
end function

function GetFirmwareVersion() as string
  roInfo = CreateObject("roDeviceInfo")
  v = roInfo.GetOsVersion()
  major = v.mid(2, 1)
  minor = v.mid(5, 1)
  return major + "." + minor
end function

function GetDeviceName() as string
  deviceInfo = CreateObject("roDeviceInfo")

  return deviceInfo.GetFriendlyName() + " " + deviceInfo.GetModel()
end function