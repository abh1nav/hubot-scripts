# Description
#	Respond to mentions of NSFW
#
# Dependencies:
#	None
#
# Configuration:
#	None
#
# Commands:
# 	None
#
# Author
#	Abhinav Ajgaonkar <abhinav316@gmail.com>

module.exports = (robot) ->
	robot.hear /nsfw/i, (msg) ->
		msg.send "http://i.imgur.com/nK5Ha.jpg"

