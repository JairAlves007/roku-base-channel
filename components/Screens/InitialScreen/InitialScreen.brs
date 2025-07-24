sub Init()
    SetLocalVariables()
    AdjustUI()
    SetObservers()
end sub

sub SetLocalVariables()
    m.layoutGroup = m.top.FindNode("layoutGroup")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
    m.nextScreenButton = m.top.FindNode("nextScreenButton")
end sub

sub AdjustUI()
    m.titleLabel.text = Constants().WELCOME_TITLE
    m.titleLabel.font = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.large)

    m.descriptionLabel.text = Constants().WELCOME_DESCRIPTION
    m.descriptionLabel.font = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.medium)

    screentSize = GetResolutionSizes()
    layoutGroupBoundingRect = m.layoutGroup.BoundingRect()

    m.layoutGroup.translation = [
        ((screentSize.width - layoutGroupBoundingRect.width) / 2) - layoutGroupBoundingRect.x,
        ((screentSize.height - layoutGroupBoundingRect.height) / 2) - layoutGroupBoundingRect.y,
    ]

    SetupButton()
end sub

sub SetObservers()
    m.top.ObserveField("visible", "OnVisibilityChanged")
    m.nextScreenButton.ObserveField("buttonSelected", "OnNextScreenButtonSelected")
end sub

sub SetupButton()
    buttonFont = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.larger)

    m.nextScreenButton.text = "Next Screen"
    m.nextScreenButton.textFont = buttonFont
    m.nextScreenButton.focusedTextFont = buttonFont
end sub

sub OnVisibilityChanged()
    m.nextScreenButton.SetFocus(m.top.visible)
end sub

sub OnNextScreenButtonSelected()
    m.top.nextScreen = true
end sub