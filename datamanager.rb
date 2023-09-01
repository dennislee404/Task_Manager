require 'csv'

class DataManager
	def self.load_checklist(filename)
		checklists = []
		checklists_titles = []

		CSV.foreach(filename, headers: true) do |row|
			checklist_title = row[0]
			task_name = row[1]
			task_completed = row[2]

			if checklists_titles.include? checklist_title
				i = checklists_titles.index(checklist_title)
				if checklists[i].tasks.include? task_name
					next
				else
					checklists[i].add_task(task_name)

					u = 0
					while u < checklists[i].tasks.length
						if checklists[i].tasks[u].name == task_name
							u += 1
							next
						else
							u += 1
						end
					end

					task_completed == 'true' ? checklists[i].tasks[u-1].complete_task(task_name) : next

				end

			else
				checklist = Checklist.new(checklist_title)
				checklists << checklist
				checklists_titles << checklist.title

				if checklist.tasks.include? task_name
					next
				else
					checklist.add_task(task_name)
					task_completed  == 'true' ? checklist.tasks[0].complete_task(task_name) : next
				end

			end

		end
		checklists
	end

	def self.save_checklist(filename, checklist_database)
		File.open(filename, "w+") do |file|
			file.puts "Checklist,Task,completed?"
			checklist_database.each do |checklist|
				checklist.tasks.each do |task|
					file.puts "#{checklist.title},#{task.name},#{task.completed?}"
				end			
			end
		end
	end
end


