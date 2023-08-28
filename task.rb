class Task
	attr_reader :name, :complete, :due_date
	def initialize(name, due_date)
		@name = name
		@complete = false
		@due_date = due_date		
	end
	
	def complete_task
		@complete = true
	end

	def complete?
		@complete
	end
end