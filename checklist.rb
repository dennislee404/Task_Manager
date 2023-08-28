class Checklist
	attr_reader :title, :pending_tasks, :completed_tasks
	def initialize(title)
		@title = title
		@pending_tasks = {}
		@completed_tasks = []
	end

	def add_task(name,due_date)
		Task.new(name,due_date)
		@pending_tasks[name] = due_date 
	end

	def complete_task(name)
		@pending_tasks.delete(name)
		@completed_tasks << name
	end

	def delete_task(name)
		@pending_task.delete(name)
	end
end