function WriteRegistryEntry(section as string, key as string, value as string) as void
  roRegistry = CreateObject("roRegistrySection", section)
  roRegistry.Write(key, value)
  roRegistry.Flush()
end function

function RegistryEntryExists(section as string, key as string) as boolean
  roRegistry = CreateObject("roRegistrySection", section)

  return roRegistry.Exists(key)
end function

function ReadRegistryEntry(section as string, key as string) as object
  roRegistry = CreateObject("roRegistrySection", section)

  res = invalid

  if RegistryEntryExists(section, key) then
    res = roRegistry.Read(key)
  end if

  return res
end function

function DeleteRegistryEntry(section as string, key as string) as void
  roRegistry = CreateObject("roRegistrySection", section)

  if RegistryEntryExists(section, key) then
    roRegistry.Delete(key)
    roRegistry.Flush()
  end if
end function

function ListRegistryEntries(section as string) as object
  roRegistry = CreateObject("roRegistrySection", section)
  allKeys = roRegistry.getKeyList()

  res = CreateObject("roAssociativeArray")
  for each key in allKeys
    res.addReplace(key, roRegistry.Read(key))
  end for

  return res
end function

function ListRegistrySections() as object
  roRegistry = CreateObject("roRegistry")
  return roRegistry.getSectionList()
end function

function DeleteAllRegistryEntries(section as string) as void
  roRegistry = CreateObject("roRegistrySection", section)

  allKeys = roRegistry.getKeyList()
  allKeys.resetIndex()
  key = allKeys.getIndex()

  while key <> invalid
    roRegistry.Delete(key)
    roRegistry.Flush()
    key = allKeys.getIndex()
  end while
end function