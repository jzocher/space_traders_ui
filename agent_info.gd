extends Node

var auth_token = ""
var account_id = ""
var agent_name = ""
var headquarters = ""
var credits = 0
var starting_faction = ""
var ship_count = 0
var contracts = {}
var current_faction = {}
var current_ship = {}


	#"contract": {
	  #"id": "cm4j6w1lp011es60ctzkfrmt5",
	  #"factionSymbol": "COSMIC",
	  #"type": "PROCUREMENT",
	  #"terms": {
		#"deadline": "2024-12-18T01:06:09.542Z",
		#"payment": {
		  #"onAccepted": 2109,
		  #"onFulfilled": 12656
		#},
		#"deliver": [
		  #{
			#"tradeSymbol": "ALUMINUM_ORE",
			#"destinationSymbol": "X1-J69-H55",
			#"unitsRequired": 59,
			#"unitsFulfilled": 0
		  #}
		#]
	  #},
	  #"accepted": false,
	  #"fulfilled": false,
	  #"expiration": "2024-12-12T01:06:09.542Z",
	  #"deadlineToAccept": "2024-12-12T01:06:09.542Z"
	#},
	#"faction": {
	  #"symbol": "COSMIC",
	  #"name": "Cosmic Engineers",
	  #"description": "The Cosmic Engineers are a group of highly advanced scientists and engineers who seek to terraform and colonize new worlds, pushing the boundaries of technology and exploration.",
	  #"headquarters": "X1-FZ42",
	  #"traits": [
		#{
		  #"symbol": "INNOVATIVE",
		  #"name": "Innovative",
		  #"description": "Willing to try new and untested ideas. Sometimes able to come up with creative and original solutions to problems, and may be able to think outside the box. Sometimes at the forefront of technological or social change, and may be willing to take risks in order to advance the boundaries of human knowledge and understanding."
		#},
		#{
		  #"symbol": "BOLD",
		  #"name": "Bold",
		  #"description": "Unafraid to take risks and challenge the status quo. Sometimes willing to do things that others would not dare, and may be able to overcome obstacles and challenges that would be insurmountable for others. Sometimes able to inspire and motivate others to take bold action as well."
		#},
		#{
		  #"symbol": "VISIONARY",
		  #"name": "Visionary",
		  #"description": "Possessing a clear and compelling vision for the future. Sometimes able to see beyond the present and anticipate the needs and challenges of tomorrow. Sometimes able to inspire and guide others towards a better and brighter future, and may be willing to take bold and decisive action to make their vision a reality."
		#},
		#{
		  #"symbol": "CURIOUS",
		  #"name": "Curious",
		  #"description": "Possessing a strong desire to learn and explore. Sometimes interested in a wide range of topics and may be willing to take risks in order to satisfy their curiosity. Sometimes able to think outside the box and come up with creative solutions to challenges."
		#}
	  #],
	  #"isRecruiting": true
	#},
	#"ship": {
	  #"symbol": "REHCOZ-1",
	  #"nav": {
		#"systemSymbol": "X1-J69",
		#"waypointSymbol": "X1-J69-A1",
		#"route": {
		  #"origin": {
			#"symbol": "X1-J69-A1",
			#"type": "PLANET",
			#"systemSymbol": "X1-J69",
			#"x": -15,
			#"y": -19
		  #},
		  #"destination": {
			#"symbol": "X1-J69-A1",
			#"type": "PLANET",
			#"systemSymbol": "X1-J69",
			#"x": -15,
			#"y": -19
		  #},
		  #"arrival": "2024-12-11T01:06:09.594Z",
		  #"departureTime": "2024-12-11T01:06:09.594Z"
		#},
		#"status": "DOCKED",
		#"flightMode": "CRUISE"
	  #},
	  #"crew": {
		#"current": 57,
		#"capacity": 80,
		#"required": 57,
		#"rotation": "STRICT",
		#"morale": 100,
		#"wages": 0
	  #},
	  #"fuel": {
		#"current": 400,
		#"capacity": 400,
		#"consumed": {
		  #"amount": 0,
		  #"timestamp": "2024-12-11T01:06:09.594Z"
		#}
	  #},
	  #"cooldown": {
		#"shipSymbol": "REHCOZ-1",
		#"totalSeconds": 0,
		#"remainingSeconds": 0
	  #},
	  #"frame": {
		#"symbol": "FRAME_FRIGATE",
		#"name": "Frigate",
		#"description": "A medium-sized, multi-purpose spacecraft, often used for combat, transport, or support operations.",
		#"moduleSlots": 8,
		#"mountingPoints": 5,
		#"fuelCapacity": 400,
		#"condition": 1,
		#"integrity": 1,
		#"requirements": {
		  #"power": 8,
		  #"crew": 25
		#}
	  #},
	  #"reactor": {
		#"symbol": "REACTOR_FISSION_I",
		#"name": "Fission Reactor I",
		#"description": "A basic fission power reactor, used to generate electricity from nuclear fission reactions.",
		#"condition": 1,
		#"integrity": 1,
		#"powerOutput": 31,
		#"requirements": {
		  #"crew": 8
		#}
	  #},
	  #"engine": {
		#"symbol": "ENGINE_ION_DRIVE_II",
		#"name": "Ion Drive II",
		#"description": "An advanced propulsion system that uses ionized particles to generate high-speed, low-thrust acceleration, with improved efficiency and performance.",
		#"condition": 1,
		#"integrity": 1,
		#"speed": 30,
		#"requirements": {
		  #"power": 6,
		  #"crew": 8
		#}
	  #},
	  #"modules": [
		#{
		  #"symbol": "MODULE_CARGO_HOLD_II",
		  #"name": "Expanded Cargo Hold",
		  #"description": "An expanded cargo hold module that provides more efficient storage space for a ship's cargo.",
		  #"capacity": 40,
		  #"requirements": {
			#"crew": 2,
			#"power": 2,
			#"slots": 2
		  #}
		#},
		#{
		  #"symbol": "MODULE_CREW_QUARTERS_I",
		  #"name": "Crew Quarters",
		  #"description": "A module that provides living space and amenities for the crew.",
		  #"capacity": 40,
		  #"requirements": {
			#"crew": 2,
			#"power": 1,
			#"slots": 1
		  #}
		#},
		#{
		  #"symbol": "MODULE_CREW_QUARTERS_I",
		  #"name": "Crew Quarters",
		  #"description": "A module that provides living space and amenities for the crew.",
		  #"capacity": 40,
		  #"requirements": {
			#"crew": 2,
			#"power": 1,
			#"slots": 1
		  #}
		#},
		#{
		  #"symbol": "MODULE_MINERAL_PROCESSOR_I",
		  #"name": "Mineral Processor",
		  #"description": "Crushes and processes extracted minerals and ores into their component parts, filters out impurities, and containerizes them into raw storage units.",
		  #"requirements": {
			#"crew": 0,
			#"power": 1,
			#"slots": 2
		  #}
		#},
		#{
		  #"symbol": "MODULE_GAS_PROCESSOR_I",
		  #"name": "Gas Processor",
		  #"description": "Filters and processes extracted gases into their component parts, filters out impurities, and containerizes them into raw storage units.",
		  #"requirements": {
			#"crew": 0,
			#"power": 1,
			#"slots": 2
		  #}
		#}
	  #],
	  #"mounts": [
		#{
		  #"symbol": "MOUNT_SENSOR_ARRAY_II",
		  #"name": "Sensor Array II",
		  #"description": "An advanced sensor array that improves a ship's ability to detect and track other objects in space with greater accuracy and range.",
		  #"strength": 4,
		  #"requirements": {
			#"crew": 2,
			#"power": 2
		  #}
		#},
		#{
		  #"symbol": "MOUNT_GAS_SIPHON_II",
		  #"name": "Gas Siphon II",
		  #"description": "An advanced gas siphon that can extract gas from gas giants and other gas-rich bodies more efficiently and at a higher rate.",
		  #"strength": 20,
		  #"requirements": {
			#"crew": 2,
			#"power": 2
		  #}
		#},
		#{
		  #"symbol": "MOUNT_MINING_LASER_II",
		  #"name": "Mining Laser II",
		  #"description": "An advanced mining laser that is more efficient and effective at extracting valuable minerals from asteroids and other space objects.",
		  #"strength": 5,
		  #"requirements": {
			#"crew": 2,
			#"power": 2
		  #}
		#},
		#{
		  #"symbol": "MOUNT_SURVEYOR_II",
		  #"name": "Surveyor II",
		  #"description": "An advanced survey probe that can be used to gather information about a mineral deposit with greater accuracy.",
		  #"strength": 2,
		  #"deposits": [
			#"QUARTZ_SAND",
			#"SILICON_CRYSTALS",
			#"PRECIOUS_STONES",
			#"ICE_WATER",
			#"AMMONIA_ICE",
			#"IRON_ORE",
			#"COPPER_ORE",
			#"SILVER_ORE",
			#"ALUMINUM_ORE",
			#"GOLD_ORE",
			#"PLATINUM_ORE",
			#"DIAMONDS",
			#"URANITE_ORE"
		  #],
		  #"requirements": {
			#"crew": 4,
			#"power": 3
		  #}
		#}
	  #],
	  #"registration": {
		#"name": "REHCOZ-1",
		#"factionSymbol": "COSMIC",
		#"role": "COMMAND"
	  #},
	  #"cargo": {
		#"capacity": 40,
		#"units": 0,
		#"inventory": []
	  #}
	#}
  #}
#}
