# Deploy with capistrano
#
# Usage:
# deploy <repo>
# what can you deploy?
#
hackers = [
  "http://hubot-assets.s3.amazonaws.com/hackers/1.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/2.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/3.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/4.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/5.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/6.gif",
  "http://hubot-assets.s3.amazonaws.com/hackers/7.gif",
]

#array of the repo names to match and deploy
repos = [
  "omp",
  "boss",
  "uploaders",
  "biemedia"
]

module.exports = (robot) ->
  robot.respond /deploy (.+)/i, (msg) ->
    if msg.match[1] in repos
      #send waiting messages
      msg.send 'Attempting Deploy. Please Hold.'
      msg.send msg.random hackers

      #hit the sinatra app to do the deploy
      msg.http("http://localhost:9393/deploy/#{msg.match[1]}")
      .get() (err, res, body) ->
        if res.statusCode == 404
          msg.send 'Something went horribly wrong'
        else
          msg.send 'Deployed like a boss'
          msg.send 'http://hubot-assets.s3.amazonaws.com/fuck-yeah/3.gif'
    else
      msg.send 'Nope. I dont know what that is. Try deploying one of these: ' + repos.join(", ")


  robot.respond /(what can you deploy?)/i, (msg) ->
    msg.send 'I can deploy the shit out of ' + repos.join(", ")