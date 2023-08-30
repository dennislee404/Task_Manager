class Checklist
	attr_reader :title, :tasks
	def initialize(title)
		@title = title
		@tasks = []
		puts "\nChecklist '#{title}' created"
	end

	def add_task(task_name)
		task = Task.new(task_name)
		@tasks << task
		puts "'#{task.name}' added to '#{@title}'"
	end

	def display_task
		puts "\n#{@title}"
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
		puts "\n'#{tasks[index].name}' deleted from '#{@title}'"
		@tasks.delete_at(index)
	end
end