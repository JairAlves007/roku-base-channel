sub Main()
    ShowChannelRSGScreen()
end sub

sub ShowChannelRSGScreen()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")

    screen.SetMessagePort(m.port)
    screen.CreateScene("MainScene")
    screen.Show()
    ' vscode_rdb_on_device_component_entry

    while true
        msg = wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreenEvent" then
            if msg.IsScreenClosed() then return
        end if
    end while
end sub
