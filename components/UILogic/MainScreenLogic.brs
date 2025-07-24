sub SetGlobalVariables()
    m.global.Update({ styleGuide: GetStyleGuideConfiguration() }, true)
    m.global.Update({ apiRoutes: GetAPIRoutes() }, true)
end sub

sub OnMainSceneSuspend(args as dynamic)
  print "***** Suspending Channel *****"
  print "Args passed into suspend callback: "; args
end sub

sub OnMainSceneResume(args as dynamic)
  print "***** Resuming Channel *****"
  print "Args passed into resume callback: "; args
end sub