require './user.rb'
require './task.rb'
require './checklist.rb'


checklist = Checklist.new("Elevate")
puts checklist.title

i=1
while i < 10
	checklist.add_task("task #{i}", "due date #{i}")
	i += 1 
end

checklist.pending_tasks.each do |task, due_date|
	puts "#{task} : #{due_date}"
end

checklist.complete_task("task 3")
checklist.complete_task("task 8")

puts "----------------------"

checklist.pending_tasks.each do |task, due_date|
	puts "#{task} : #{due_date}"
end

puts "----------------------"
puts "completed tasks"
puts checklist.completed_tasks








# puts "#{jocha_checklist.tasks.keys[0]} by #{jocha_checklist.tasks.values[0]}"
# puts "#{jocha_checklist.tasks.keys[1]} by #{jocha_checklist.tasks.values[1]}"

# elevate_checklist = Checklist.new("Elevate")



# jocha_task1 = Task.new("Design Merdeka Day Giveaway poster", "2023-09-02")
# jocha_task2 = Task.new("Draw floorplan for new outlet", "2023-08-31")

# elevate_task1 = Task.new("Complete TaskManager Assignment", "2023-08-31")
# elevate_task2 = Task.new("Group Project", "2023-09-08")

