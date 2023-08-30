class Checklist
	attr_reader :title, :tasks
	def initialize(title)
		@title = title
		@tasks = []
		puts "Checklist '#{title}' created"
	end

	def add_task(task_name)
		task = Task.new(task_name)
		@tasks << task
		puts "'#{task.name}'' added to '#{@title}'"
	end

	def display_task
		@tasks.each_with_index do |task, index|

			if task.completed?
				status = "[x]"
			else
				status = "[ ]"
			end

			puts "#{index + 1} - #{status} - #{task.name}"
		end
	end

	def delete_task(index)
		puts "'#{tasks[index-1].name}'' deleted from '#{@title}'"
		@tasks.delete_at(index-1)
	end
end