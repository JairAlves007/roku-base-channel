function SetTwoDirectionsNavigation(focusableChildren as object, navigationXIndex as integer, navigationYIndex as integer, keyPressed as string) as object
  finalResult = {
    handled: false,
    navigationXIndex: navigationXIndex,
    navigationYIndex: navigationYIndex,
    direction: "none",
  }

  if not IsArray(focusableChildren) or focusableChildren.Count() <= 0 or not IsInteger(navigationXIndex) or not IsInteger(navigationYIndex) or not IsString(keyPressed) or StringIsEmpty(keyPressed) then return finalResult

  if focusableChildren[navigationYIndex] = invalid then return finalResult

  directionX = 0
  directionY = 0
  direction = finalResult.direction

  verticalArrows = ["down", "up"]
  horizontalArrows = ["right", "left"]

  if keyPressed = verticalArrows[0] then
    directionY = 1
    direction = verticalArrows[0]
  end if

  if keyPressed = verticalArrows[1] then
    directionY = -1
    direction = verticalArrows[1]
  end if

  if keyPressed = horizontalArrows[0] then
    directionX = 1
    direction = horizontalArrows[0]
  end if

  if keyPressed = horizontalArrows[1] then
    directionX = -1
    direction = horizontalArrows[1]
  end if

  verifyVerticalDirection = navigationYIndex + directionY
  verifyHorizontalDirection = navigationXIndex + directionX

  if verifyVerticalDirection < 0 or verifyVerticalDirection > focusableChildren.Count() - 1 then return finalResult
  if verifyHorizontalDirection < 0 or verifyHorizontalDirection > focusableChildren[navigationYIndex].Count() - 1 then return finalResult

  if direction = verticalArrows[0] or direction = verticalArrows[1] then verifyHorizontalDirection = 0

  focusableChildren[navigationYIndex][navigationXIndex].SetFocus(false)
  finalResult.navigationXIndex = verifyHorizontalDirection
  finalResult.navigationYIndex = verifyVerticalDirection
  finalResult.direction = direction
  finalResult.handled = true

  if focusableChildren[finalResult.navigationYIndex][finalResult.navigationXIndex] = invalid then finalResult.navigationXIndex = 0

  focusableChildren[finalResult.navigationYIndex][finalResult.navigationXIndex].SetFocus(true)

  return finalResult
end function