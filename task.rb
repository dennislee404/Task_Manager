class Task
	attr_reader :name, :completed, :due_date, :assigned_to
	def initialize(name, due_date=nil)
		@name = name
		@completed = false
		@due_date = due_date
		@assigned_to = []
		@comments = []
	end
	
	def complete_task(task_name)
		@completed = true
		puts "#{task_name} completed"
	end

	def completed?
		@completed
	end

	def assign_user(user,task)
		@assigned_to << user.name
		user.receive_task(task)
	end

	def set_due_date(date)
		@due_date = date
	end

	def add_comment(comment)
		@comments << comment
	end
end