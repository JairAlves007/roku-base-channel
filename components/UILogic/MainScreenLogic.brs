sub SetGlobalVariables()
    m.global.Update({ styleGuide: GetStyleGuideConfiguration() }, true)
    m.global.Update({ apiRoutes: GetAPIRoutes() }, true)
end sub