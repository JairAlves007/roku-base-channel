sub Init()
    SetLocalVariables()
    AdjustUI()
end sub

sub SetLocalVariables()
    m.cardItemContainer = m.top.FindNode("cardItemContainer")
    m.cardItemBaseMask = m.top.FindNode("cardItemBaseMask")
    m.cardItemImageMask = m.top.FindNode("cardItemImageMask")
    m.cardItemBorderFocusMask = m.top.FindNode("cardItemBorderFocusMask")
    m.cardItemImage = m.cardItemImageMask.FindNode("cardItemImage")

    m.itemSize = m.global.styleGuide.sizes.card
end sub

sub AdjustUI()
    m.cardItemContainer.width = m.itemSize.width
    m.cardItemContainer.height = m.itemSize.height
    m.cardItemContainer.color = m.global.styleGuide.colors.transparent

    maskGroups = [
        {
            maskGroup: m.cardItemBaseMask,
            color: m.global.styleGuide.colors.black.light
        },
        {
            maskGroup: m.cardItemImageMask,
            color: m.global.styleGuide.colors.transparent
        },
        {
            maskGroup: m.cardItemBorderFocusMask,
            color: m.global.styleGuide.colors.orange.neutral
        }
    ]

    for each item in maskGroups
        maskGroup = item.maskGroup
        maskGroupImage = maskGroup.GetChild(0)

        if maskGroupImage = invalid then
            maskGroupImage = maskGroup.CreateChild("Poster")
        end if

        maskGroup.masksize = [FixValueBasedInUIResolution(m.itemSize.width), FixValueBasedInUIResolution(m.itemSize.height)]

        maskGroupImage.width = m.itemSize.width
        maskGroupImage.height = m.itemSize.height
        maskGroupImage.loadWidth = m.itemSize.width
        maskGroupImage.loadHeight = m.itemSize.height
        maskGroupImage.uri = GetColorImage(item.color)
    end for

    m.cardItemBorderFocusMask.opacity = 0
    m.cardItemImage.loadDisplayMode = "scaleToFill"
end sub

sub OnContentSet()
    content = m.top.itemContent

    m.cardItemImage.uri = content.highlight

    if m.top.rowListHasFocus then m.cardItemBorderFocusMask.opacity = 0
end sub

function CanSetFocus() as boolean
    rowHasFocus = m.top.rowHasFocus
    rowListHasFocus = m.top.rowListHasFocus

    return rowListHasFocus and rowHasFocus
end function

sub OnItemHasFocus()
    if m.top.itemHasFocus then m.cardItemBorderFocusMask.opacity = 1
end sub

sub OnFocusPercentChanged(event as object)
    focusPercent = event.GetData()

    if not CanSetFocus() then focusPercent = 0

    m.cardItemBorderFocusMask.opacity = focusPercent
end sub

sub OnRowHasFocus()
    if CanSetFocus() then
        m.top.focusPercent = 1
        return
    end if

    m.top.focusPercent = 0
end sub

sub OnRowListHasFocus()
    if not m.top.rowListHasFocus or not m.top.rowHasFocus then m.cardItemBorderFocusMask.opacity = 0
end sub
