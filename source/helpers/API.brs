function GetAPIRoutes() as object
  return {
    "routeGroup": {
      "routeType": {
        route: "/test",
        method: "GET"
      }
    },
  }
end function

function GetAPIBaseURL() as string
  return "http://base.url/api"
end function