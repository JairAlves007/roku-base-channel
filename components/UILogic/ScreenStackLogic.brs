sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as object)
    prev = GetCurrentScreen()
    if prev <> invalid
        prev.visible = false

        if prev.focusedChild <> invalid then prev.focusedChild.SetFocus(false)
        prev.SetFocus(false)
    end if

    m.top.AppendChild(node)
    node.visible = true
    node.SetFocus(true)
    m.screenStack.Push(node)
end sub

function GetCurrentScreen()
    return m.screenStack.Peek()
end function

sub CloseScreen(node as object)
    if node = invalid or (GetCurrentScreen() <> invalid and GetCurrentScreen().IsSameNode(node))
        last = m.screenStack.Pop()
        last.visible = false
        m.top.RemoveChild(node)

        prev = GetCurrentScreen()
        if prev <> invalid then
            prev.visible = true
            prev.SetFocus(true)
        end if
    end if
end sub

sub ClearScreenStack()
    if m.screenStack.Count() > 0
        while m.screenStack.Count() > 0
            last = m.screenStack.Pop()

            if last.visible = true
                last.visible = false
            end if

            m.top.RemoveChild(last)
        end while
    else
        GetCurrentScreen().visible = false
    end if
end sub

function IsScreenInScreenStack(node as object) as boolean
    for each screen in m.screenStack
        result = screen.IsSameNode(node)
        if result = true
            return true
        end if
    end for
    return false
end function