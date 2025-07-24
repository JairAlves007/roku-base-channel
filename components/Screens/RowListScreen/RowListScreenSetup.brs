sub Init()
    SetLocalVariables()
    AdjustUI()
    SetObservers()
end sub

sub SetLocalVariables()
    m.layoutGroup = m.top.FindNode("layoutGroup")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.rowList = m.top.FindNode("rowList")
    m.backScreenButton = m.top.FindNode("backScreenButton")

    m.focusableChildren = [
        [m.rowList],
        [m.backScreenButton]
    ]
    m.navigationYIndex = 0
    m.navigationXIndex = 0
end sub

sub AdjustUI()
    m.titleLabel.text = "Row List and Focus Handling"
    m.titleLabel.font = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.large)

    screentSize = GetResolutionSizes()
    layoutGroupBoundingRect = m.layoutGroup.BoundingRect()

    m.layoutGroup.translation = [
        ((screentSize.width - layoutGroupBoundingRect.width) / 2) - layoutGroupBoundingRect.x,
        ((screentSize.height - layoutGroupBoundingRect.height) / 2) - layoutGroupBoundingRect.y,
    ]

    SetupRowList()
    SetupButton()

    m.focusableChildren[m.navigationYIndex][m.navigationXIndex].SetFocus(true)
end sub

sub SetObservers()
    m.backScreenButton.ObserveField("buttonSelected", "OnBackScreenButtonSelected")
end sub

sub SetupRowList()
    content = GetContent()
    itemSize = m.global.styleGuide.sizes.card

    m.rowList.content = content
    m.rowList.numRows = 1
    m.rowList.itemSize = [(GetResolutionSizes().width / 1.5) + 50, itemSize.height]
    m.rowList.rowHeights = [itemSize.height]
    m.rowList.rowItemSize = [[itemSize.width, itemSize.height]]
    m.rowList.itemSpacing = [0, 80]
    m.rowList.rowItemSpacing = [[12, 0]]
    m.rowList.rowLabelOffset = [[0, 20]]
    m.rowList.showRowLabel = true
    m.rowList.rowFocusAnimationStyle = "floatingFocus"
    m.rowList.vertFocusAnimationStyle = "floatingFocus"
    m.rowList.skipFocusAnimations = true
    m.rowList.scrollSpeed = 1
    m.rowList.drawFocusFeedback = false
    m.rowList.rowLabelColor = m.global.styleGuide.colors.white.neutral
    m.rowList.itemComponentName = "CardItem"
    m.rowList.rowLabelFont = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.medium)
end sub

sub SetupButton()
    buttonFont = CreateFont(m.global.styleGuide.fonts.primary, "bold", m.global.styleGuide.fontSizes.larger)

    m.backScreenButton.text = "Back Screen"
    m.backScreenButton.textFont = buttonFont
    m.backScreenButton.focusedTextFont = buttonFont
end sub