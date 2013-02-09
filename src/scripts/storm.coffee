spawn = require('child_process').spawn

module.exports = (robot) ->
	robot.respond /storm kill/i, (msg) ->
		spl =  msg.message.text.split " "
		topology_name = ""
		if spl[0] is "stig"
			topology_name = spl[4]
		else
			topology_name = spl[3]

		msg.send "About to kill " + topology_name
		cmd = spawn "/home/ubuntu/storm-jars/kill.sh", [topology_name]

		cmd.stdout.on "data", (data) ->
			if data.toString().indexOf("Killed topology") > -1
				msg.send "Finished killing " + topology_name
		
		cmd.stderr.on "data", (data) ->
			if data.toString().indexOf("NotAliveException") > -1
				msg.send "Topology " + topology_name + " doesn't exist. WAT."

		cmd.on "exit", (code) ->
			msg.send "Finished executing 'kill' - return code: " + code

	robot.respond /storm deploy/i, (msg) ->
		spl = msg.message.text.split " "

		topology_name = ""
		if spl[0] is "stig"
			topology_name = spl[4]
		else
			topology_name = spl[3]
		
		msg.send "Deploying topology " + topology_name

		cmd = spawn "/home/ubuntu/storm-jars/deploy.sh", [topology_name]

		cmd.stdout.on "data", (data) ->
			if data.toString().indexOf("Finished submitting topology") > -1
				msg.send "Finished deploying topology"

		cmd.stderr.on "data", (data) ->
			if data.toString().indexOf("AlreadyAlive") > -1
				msg.send "Topology is already alive. Try again in a minute."

		cmd.on "exit", (code) ->
			msg.send "Finished deploying " + topology_name + " - code: " + code
	
	robot.respond /storm test/i, (msg) ->
		msg.send "Got it"
		setTimeout( () -> msg.send "Callback", 5000 )
