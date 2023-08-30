require 'csv'

class DataManager
	def self.load_checklist(filename)
		checklists = []
		checklists_titles = []

		CSV.foreach(filename, headers: true) do |row|
			checklist_title = row[0]

			if checklists_titles.include? checklist_title
				next
			else
				checklist = Checklist.new(checklist_title)
				checklists << checklist
				checklists_titles << checklist.title
			end
		



		end
		checklists
	end







end