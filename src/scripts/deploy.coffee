# Deploy with capistrano
#
# deploy <repo>
#
carltons = [
  "http://hubot-assets.s3.amazonaws.com/hackers/1.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/2.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/3.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/4.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/5.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/6.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/7.gif",
]

module.exports = (robot) ->
  robot.respond /deploy (.+)/i, (msg) ->
    if msg.match[1] == "omp" or msg.match[1] == "boss" or msg.match[1] == "uploaders" or msg.match[1] == "biemedia"
      msg.send 'Attempting Deploy. Please Hold.'
      msg.send msg.random carltons
      msg.http("http://localhost:9393/deploy/#{msg.match[1]}")
      .get() (err, res, body) ->
        if res.statusCode == 404
          msg.send 'Something went horribly wrong'
        else
          msg.send 'Deployed like a boss'
          msg.send 'http://hubot-assets.s3.amazonaws.com/fuck-yeah/3.gif'
    else
      msg.send 'Nope. That application is not real.'
  robot.respond /(what can you deploy?)/i, (msg) ->
    msg.send 'I can deploy the shit out of omp, boss, biemedia, and uploaders'