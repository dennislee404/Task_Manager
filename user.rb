class User
	attr_reader :name, :tasks
	def initialize(name)
		@name = name
		@tasks = []		
	end

	def receive_task(task)
		@tasks << task
	end
end