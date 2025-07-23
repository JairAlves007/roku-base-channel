sub Init()
    SetLocalVariables()
    AdjustUI()
end sub

sub SetLocalVariables()
    m.welcomeLabel = m.top.FindNode("welcomeLabel")
end sub

sub AdjustUI()
    m.welcomeLabel.text = "Welcome to my App!"
    m.welcomeLabel.textAlign = "center"
end sub