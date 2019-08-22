class CosmicSynapse
	 def initialize(name)
		@name = name
	end
	
	def printCosmosDetails
		 puts "Cosmos name = #{@name}"
	end
	
	class InnerCosmicSynapse
		def initialize(adapter, protocolHandler)
			@adapter = adapter
			@protocolHandler = protocolHandler
		end
		
		def printSynapseDetails
			puts "Adapter =  #{@adapter}"
			puts "Protocol Handler = #{@protocolHandler}"
		end
	end
end

cs = CosmicSynapse.new("Andromeda")
cs.printCosmosDetails()

ics = CosmicSynapse::InnerCosmicSynapse.new("SatelliteAdapter", "HTTPController")
ics.printSynapseDetails()