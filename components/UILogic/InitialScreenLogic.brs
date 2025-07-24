sub ShowInitialScreen()
  m.InitialScreen = CreateObject("roSGNode", "InitialScreen")
  m.InitialScreen.ObserveField("nextScreen", "ShowRowListScreen")
  ShowScreen(m.InitialScreen)
end sub