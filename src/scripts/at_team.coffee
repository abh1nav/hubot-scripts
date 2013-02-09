# Description:
#   Mentions all the people if you say :team
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   :team Hello Team! - mentions all the team members
#
# Author:
#   Abhinav Ajgaonkar <abhinav316@gmail.com>

module.exports = (robot) ->
	robot.hear /::team/i, (msg) ->
		spl = msg.message.text.split " "
		reply = "@abhi @ammaar @dan @drew @geoff @kent @ryan"
		for sp in spl
			if sp isnt "stig:" and sp isnt ":team"
				reply = reply + " " + sp

		msg.send reply
