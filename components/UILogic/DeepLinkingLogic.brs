function GetSupportedMediaTypes() as object
  return {
    "series": Constants().SHOW_TYPE,
  }
end function

sub OnInputDeepLinking(event as object)
  PerformDeepLinking(event.GetData())
end sub

sub PerformDeepLinking(args as dynamic)
  if args = invalid or not ValidateDeepLink(args) then return

  m.global.Update({
    deepLinkingArgs: args
  }, true)

  ' Perfome Deep Linking
  DeepLink(args.mediaType, args.contentId)
end sub

function ValidateDeepLink(args as object) as boolean
  mediaType = args.mediaType
  contentId = args.contentId
  types = GetSupportedMediaTypes()

  return IsString(mediaType) and not StringIsEmpty(mediaType) and IsString(contentId) and not StringIsEmpty(contentId) and IsString(types[mediaType])
end function

sub DeepLink(mediaType as string, contentId as string)
  print "Starting deep linking!"
  print "For mediaType: "; mediaType
  print "For contentId: "; contentId
end sub