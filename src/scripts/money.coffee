# No Fucks Given
#
# no fuck - display a not a fuck was given meme
#

no_fucks = [
  "http://hubot-assets.s3.amazonaws.com/money/6.gif",


]

module.exports = (robot) ->
  robot.hear /.*(money).*/i, (msg) ->
    msg.send msg.random no_fucks
