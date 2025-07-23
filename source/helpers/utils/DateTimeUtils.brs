function DateTimeCompare(date1 as object, date2 as object) as integer
  sd1 = date1.asSeconds()
  sd2 = date2.asSeconds()

  if sd1 < sd2 then
    return -1
  else if sd1 > sd2 then
    return 1
  else
    return 0
  end if
end function

function DateTimeIsBetween(startDateTime as object, between as object, endDateTime as object) as boolean
  return DateTimeCompare(between, startDateTime) > 0 and DateTimeCompare(between, endDateTime) < 0
end function

function DateTimeIsBefore(current as object, before as object) as boolean
  return DateTimeCompare(current, before) < 0
end function

function DateTimeIsAfter(current as object, after as object) as boolean
  return DateTimeCompare(current, after) > 0
end function

function DateTimeDateOf(year as integer, month as integer, day as integer, hour = 0 as integer, minutes = 0 as integer) as object
  hourStr = hour.toStr()
  if hour < 10 then
    hourStr = "0" + hourStr
  end if

  minuteStr = minutes.toStr()
  if minutes < 10 then
    minuteStr = "0" + minuteStr
  end if

  _date = CreateObject("roDateTime")
  _date.fromISO8601String(year.toStr() + "-" + month.toStr() + "-" + day.toStr() + " " + hourStr + ":" + minuteStr + ":00")
  return _date
end function

function DateTimeParse(d as string, t = "00:00" as string) as object
  if d = invalid then
    return invalid
  end if

  ' Tokenize from YYYY/MM/DD
  dateTokens = d.tokenize("/")

  if dateTokens.count() <> 3 then
    return invalid
  end if

  ' Now, roDateTime only likes ISO format
  ' YYYY-MM-DD HH:MM:SS
  date = CreateObject("roDateTime")
  date.fromISO8601String(dateTokens[0] + "-" + dateTokens[1] + "-" + dateTokens[2] + " " + t)

  return date
end function

function DateTimeToMidnight(date as object) as object
  year = date.getYear()
  month = date.getMonth()
  day = date.getDayOfMonth()

  return DateTimeDateOf(year, month, day, 23, 59)
end function

function DateTimeDuration(starts as object, ends as object) as integer
  if starts = invalid or ends = invalid then
    return 0
  end if

  startSeconds = starts.asSeconds()
  endSeconds = ends.asSeconds()

  return endSeconds - startSeconds
end function

function DateTimeAddDays(date as object, days as integer) as object
  if days <= 0 then
    return date
  end if

  return DateTimeAddHours(date, (days * 24))
end function

function DateTimeSubtractDays(date as object, days as integer) as object
  if days <= 0 then
    return date
  end if

  return DateTimeSubtractHours(date, (days * 24))
end function

function DateTimeAddHours(date as object, hours as integer) as object
  if hours <= 0 then
    return date
  end if

  seconds = hours * 60 * 60
  newDate = CreateObject("roDateTime")
  newDate.fromSeconds(date.asSeconds() + seconds)
  return newDate
end function

function DateTimeSubtractHours(date as object, hours as integer) as object
  if hours <= 0 then
    return date
  end if

  seconds = hours * 60 * 60
  newDate = CreateObject("roDateTime")
  newDate.fromSeconds(date.asSeconds() - seconds)
  return newDate
end function

function SecondsToHoursMinutesSeconds(seconds as integer) as object
  hours = Int(seconds / 3600)
  minutes = Int((seconds - (hours * 3600)) / 60)
  seconds = seconds - (hours * 3600) - (minutes * 60)

  return {
    hours: hours,
    minutes: minutes,
    seconds: seconds
  }
end function