require './user.rb'
require './task.rb'
require './checklist.rb'
require './datamanager.rb'
require 'colorize'


def display_checklist
	puts "\nChecklists:"
	@checklists.each_with_index do |checklist, index|
		puts "#{index + 1} - #{@checklists[index].title}"
	end
end

def delete_checklist(index)
	puts "\n#{@checklists[index].title} has been deleted"
	@checklists.delete_at(index)
end

def loop_checklist(cl_index)
	loop do
		puts "\nWhat would you like to do?"
		puts "1 - Add New Task"
		puts "2 - Display Task"
		puts "3 - Ammend Existing task"
		puts "4 - Delete checklist"
		puts "0 - Back to Main Menu"
		choice = gets.chomp.to_i

		case choice
		when 1
			puts "\nPlease name your task"
			task_name = gets.chomp
			@checklists[cl_index].add_task(task_name)

		when 2
			@checklists[cl_index].display_task

		when 3
			if @checklists[cl_index].tasks[0] == nil
				puts "\nYou have no tasks in this checklist yet. Please create new task"
			else
				@checklists[cl_index].display_task
				puts "\nPlease select task"
				task_index = gets.chomp.to_i-1 #Add error handling in case user input is invalid

				if task_index >= @checklists[cl_index].tasks.length
					puts "Invalid input"
				else
					loop_task(cl_index,task_index)
				end
			end

		when 4
			delete_checklist(cl_index)
			break

		when 0
			break
		
		end
	end
end

def loop_task(cl_index,task_index)
	loop do
		puts "\nWhat would you like to do?"
		puts "1 - Mark Complete Task"
		puts "2 - Delete Task"
		puts "3 - Assign User"
		puts "0 - Back to Checklist"
		choice = gets.chomp.to_i

		case choice
		when 1
			@checklists[cl_index].tasks[task_index].complete_task

		when 2
			@checklists[cl_index].delete_task(task_index)

		when 3
			puts "stay tune for next version :)"

		when 0
			break

		end
	end
end


@checklists = DataManager.load_checklist('checklist.csv')

puts "Welcome to Elevate Task Manager".green
# load csv file
# update @checklists = []
# update @checklists[i].tasks = []

loop do 
	puts "\nWhat would you like to do?"
	puts "1 - Create New Checklist"
	puts "2 - Existing Checklist"
	puts "0 - Exit"
	choice = gets.chomp.to_i #Need to add error handling in case user input is invalid

	case choice
	when 1
		puts "\nPlease name your checklist"
		checklist_title = gets.chomp
		checklist = Checklist.new(checklist_title)
		@checklists << checklist

	when 2
		if @checklists[0] == nil
			puts "\nYou have no checklists. Please create a new checklist"
		else
			display_checklist
			puts "Please select your checklist"
			cl_index = gets.chomp.to_i-1 #Add error handling in case user input is invalid

			if cl_index >= @checklists.length
				puts "Invalid input"
			else
				loop_checklist(cl_index)
			end
		end

	when 0
		puts "Bye"
		exit

	end
end






