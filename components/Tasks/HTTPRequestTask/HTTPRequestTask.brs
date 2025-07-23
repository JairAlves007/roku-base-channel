sub Init()
    m.top.functionName = "DoHTTPRequest"
end sub

sub DoHTTPRequest()
    result = CreateObject("roSGNode", "ContentNode")
    result.Update({
        success: false,
        message: "",
        data: {}
    }, true)

    url = m.top.url
    method = UCase(m.top.method)
    body = m.top.body
    token = m.top.token
    apiKey = m.top.apiKey
    serviceToken = m.top.serviceToken

    if StringIsEmpty(url) then
        m.top.content = result

        return
    end if

    port = CreateObject("roMessagePort")
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.SetMessagePort(port)
    urlTransfer.SetRequest(method)
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.RetainBodyOnError(true)
    urlTransfer.AddHeader("Content-Type", "application/json")

    if not StringIsEmpty(token) then urlTransfer.AddHeader("Authorization", "Bearer " + token)

    urlTransfer.InitClientCertificates()
    urlTransfer.SetUrl(url)

    responseSent = false

    if method = "GET" then
        responseSent = urlTransfer.AsyncGetToString()
    else if method <> "GET" and not StringIsEmpty(body) then
        responseSent = urlTransfer.AsyncPostFromString(body)
    end if

    if responseSent then
        while true
            msg = Wait(0, port)
            if Type(msg) = "roUrlEvent" then
                headers = msg.GetResponseHeaders()
                response = msg.GetString()
                responseIsInJSON = not StringIsEmpty(response) and StringContains(LCase(headers["Content-Type"]), "application/json")

                message = Constants().API.ERROR_MESSAGE

                if responseIsInJSON then
                    response = ParseJson(response)

                    message = Constants().API.SUCCESS_MESSAGE
                    result.data = {
                        data: response
                    }
                    result.success = true
                end if

                result.message = message
                m.top.content = result
                m.top.control = "stop"

                urlTransfer.AsyncCancel()

                exit while
            else if msg = invalid then
                urlTransfer.AsyncCancel()
            end if
        end while
    end if
end sub