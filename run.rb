require './user.rb'
require './task.rb'
require './checklist.rb'
require 'colorize'

@checklists = []

def display_checklist
	puts "Checklists:"
	@checklists.each_with_index do |checklist, index|
		puts "#{index + 1} - #{@checklists[index].title}"
	end
end

puts "Welcome to Elevate Task Manager".green

loop do 
	puts " "
	puts "What would you like to do?"
	puts "1 - Create New Checklist"
	puts "2 - Existing Checklist"
	puts "0 - Exit"
	choice = gets.chomp.to_i

	case choice
	when 1
		puts " "
		puts "Please name your checklist"
		checklist_title = gets.chomp
		checklist = Checklist.new(checklist_title)
		@checklists << checklist

	when 2
		if @checklists[0] == nil
			puts "You have no checklists. Please create a new checklist"
		else
			puts " "
			display_checklist
			puts " "
			puts "Please select your checklist"
			cl_index = gets.chomp.to_i-1
			puts "#{@checklists[cl_index].title}"

			loop do
				puts " "
				puts "What would you like to do?"
				puts "1 - Add New Task"
				puts "2 - Display Task"
				puts "3 - Mark Complete Task"
				puts "4 - Delete Task"
				puts "0 - Back to Main Menu"
				choice = gets.chomp.to_i

				case choice
				when 1
					puts " "
					puts "Please name your task"
					task_name = gets.chomp
					@checklists[cl_index].add_task(task_name)

				when 2
					puts " "
					@checklists[cl_index].display_task

				when 3
					puts " "
					@checklists[cl_index].display_task
					puts "Please select the task you want to mark as complete"
					choice = gets.chomp.to_i
					@checklists[cl_index].tasks[choice-1].complete_task
					@checklists[cl_index].display_task

				when 4
					puts " "
					@checklists[cl_index].display_task
					puts "Please select the task you want to delete"
					choice = gets.chomp.to_i
					@checklists[cl_index].delete_task(choice)
					@checklists[cl_index].display_task

				when 0
					break
				end
			end
		end

	when 0
		puts "Bye"
		exit
	end

end






