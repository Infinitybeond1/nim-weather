import os,
       osproc,
       strutils,
       httpclient

#var client = newHttpClient()
#var weather = $getContent(client ,"https://wttr.in/?format=1")

proc getTemp(): int =
  var client = newHttpClient()
  var weather = $getContent(client ,"https://wttr.in/?format=1")
  return weather.split("+")[1].strip().split("°")[0].strip().parseInt()

proc getCondition(): string =
  var client = newHttpClient()
  var weather = $getContent(client ,"https://wttr.in/?format=1")
  return weather.split("+")[0].strip()

proc getUnit(): char =
  var client = newHttpClient()
  var weather = $getContent(client ,"https://wttr.in/?format=1")
  if "F" in weather:
    return 'F'
  else:
    return 'C'

let arg = paramStr(1)

if arg == "--temp" or arg == "-t":
  echo getTemp()
elif arg == "--condition" or arg == "-c":
  echo getCondition()
elif arg == "--unit" or arg == "-u":
  echo $getUnit()
