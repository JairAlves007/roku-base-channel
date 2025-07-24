sub ShowRowListScreen()
  print "ShowRowListScreen called"
  m.RowListScreen = CreateObject("roSGNode", "RowListScreen")
  m.RowListScreen.ObserveField("backScreen", "OnBackScreen")
  ShowScreen(m.RowListScreen)
end sub

sub OnBackScreen()
  CloseScreen(m.RowListScreen)
end sub