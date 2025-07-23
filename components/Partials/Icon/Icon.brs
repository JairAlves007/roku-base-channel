sub Init()
  SetLocalVariables()
  SetObservers()
end sub

sub SetLocalVariables()
  m.types = {
    alert: ":",
    windows: ";",
    personRounded: "a",
    personOutlined: "b",
    chevronLeft: "c",
    deleteChar: "d",
    lock: "e",
    space: "f",
    check: "g",
    chevronDown: "h",
    copy: "i",
    forward: "j",
    geolocation: "k",
    home: "l",
    eyeSlashed: "m",
    eye: "n",
    info: "o",
    channelList: "p",
    live: "q",
    movie: "r",
    now: "s",
    minus: "t",
    pause: "u",
    playOutlined: "v",
    playFilled: "w",
    plusRounded: "x",
    backwards: "y",
    search: "z",
    tvShow: "â",
    config: "ç",
    chevronUp: "ö",
    buttonBorderOutlinedLeft: "÷",
    buttonBorderOutlinedRight: "û",
    buttonBorderFilledLeft: "ü",
    buttonBorderFilledRight: "ÿ",
  }

  font = CreateObject("roSGNode", "Font")
  font.uri = "pkg:/source/fonts/icons/icon-font.ttf"
  m.top.font = font
end sub

sub SetObservers()
  m.top.ObserveField("type", "OnTypeSet")
  m.top.ObserveField("color", "OnColorSet")
  m.top.ObserveField("size", "OnSizeSet")
end sub

sub OnTypeSet()
  iconType = m.top.type

  if m.types[iconType] <> invalid then m.top.text = m.types[iconType]
end sub

sub OnColorSet()
  m.top.color = m.top.color
end sub

sub OnSizeSet()
  m.top.font.size = m.top.size
end sub