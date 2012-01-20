# Grab XKCD comic image urls
#
# xkcd       - The latest XKCD comic
# xkcd <num> - XKCD comic matching the supplied number
#
module.exports = (robot) ->
  robot.respond /deploy\s?(\d+)?/i, (msg) ->
    if msg.match[1] == undefined
      msg.send 'Can not deploy'
    else
      num = "#{msg.match[1]}"

    msg.http("http://localhost:9393/deploy/#{msg.match[1]}")
      .get() (err, res, body) ->
        if res.statusCode == 404
          msg.send 'Something went horribly wrong'
        else
          msg.send 'Deployed like a boss'