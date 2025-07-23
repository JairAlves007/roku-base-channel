sub Main(args as object)
    ShowChannelRSGScreen(args)
end sub

sub ShowChannelRSGScreen(args as object)
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")

    screen.SetMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.Show()
    ' vscode_rdb_on_device_component_entry

    scene.launchArgs = args
    inputObject = CreateObject("roInput")
    inputObject.SetMessagePort(m.port)

    while true
        msg = wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreenEvent" then
            if msg.IsScreenClosed() then return
        else if msgType = "roInputEvent" then
            inputData = msg.GetInfo()

            if inputData.DoesExist("mediaType") and inputData.DoesExist("contentId") then
                deepLink = {
                    mediaType: inputData.mediaType,
                    contentId: inputData.contentId
                }

                scene.inputArgs = deepLink
            end if
        end if
    end while
end sub
