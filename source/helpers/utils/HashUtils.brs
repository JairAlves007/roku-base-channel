function ToMD5Hash(text as string) as string
  return Hash(text, "md5")
end function

function ToSHA1Hash(text as string) as string
  return Hash(text, "sha1")
end function

function ToSHA256Hash(text as string) as string
  return Hash(text, "sha256")
end function

function ToSHA512Hash(text as string) as string
  return Hash(text, "sha512")
end function

function Hash(text as object, algorithm = "md5" as string) as string
  ba = CreateObject("roByteArray")
  ba.fromASCIIString(text)
  digest = CreateObject("roEVPDigest")
  digest.setup(algorithm)
  return digest.process(ba)
end function