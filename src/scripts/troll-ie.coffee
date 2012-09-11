# Description:
#   Display's the troll IE image whenever it hears internet explorer being mentioned
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   internet explorer
#
# Author:
#   abh1nav


module.exports = (robot) ->
  robot.hear /internet explorer/i, (msg) ->
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/26540/160941/6ooq8zi7ubaubbx/troll_ie.png"