function GetStyleGuideConfiguration() as object
  return {
    "fonts": {
      "primary": "Roboto",
      "secondary": "RobotoCondensed",
      "Roboto": {
        thin: "pkg:/source/fonts/Roboto/Roboto-Thin.ttf",
        light: "pkg:/source/fonts/Roboto/Roboto-Light.ttf",
        regular: "pkg:/source/fonts/Roboto/Roboto-Regular.ttf",
        medium: "pkg:/source/fonts/Roboto/Roboto-Medium.ttf",
        bold: "pkg:/source/fonts/Roboto/Roboto-Bold.ttf",
        black: "pkg:/source/fonts/Roboto/Roboto-Black.ttf",
      },
      "RobotoCondensed": {
        thin: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Thin.ttf",
        light: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Light.ttf",
        regular: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Regular.ttf",
        medium: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Medium.ttf",
        bold: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Bold.ttf",
        black: "pkg:/source/fonts/RobotoCondensed/RobotoCondensed-Black.ttf",
      }
    },
    "colors": {
      gray: {
        lightest: "#E2E2E2",
        lighter: "#C5C5C5",
        light: "#666666",
        medium: "#3A4044",
        neutral: "#37373C",
        dark: "#7A7A7A",
        darker: "#1E1E22",
      },
      black: {
        lighter: "#363636",
        light: "#26262A",
        neutral: "#0C0C0C",
        dark: "#1A1A1C",
        darker: "#141414",
      },
      orange: {
        lighter: "#FFDAD5",
        light: "#FFB4AA",
        medium: "#FE9579",
        neutral: "#E96744",
        dark: "#B72600",
        darker: "#541100",
      },
      white: {
        lighter: "#A4A4A4",
        light: "#F0F3FF",
        neutral: "#FAFAFA",
        dark: "#424242",
      },
      red: {
        light: "#FF4646",
        neutral: "#DA2323",
      },
      green: {
        neutral: "#2DA01B",
      },
      yellow: {
        neutral: "#ECD930",
        dark: "#DDAE4A",
      },
      transparent: "#00000000",
    },
    "fontSizes": {
      biggest: 80
      big: 64
      largest: 48
      larger: 40
      large: 32
      medium: 28
      default: 24
      small: 20
      smaller: 18
      smallest: 16
    },
  }
end function