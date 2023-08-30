require 'csv
'
class DataManager
	def self.load_checklist(filename)
		checklist_data = []

		CSV.foreach(filename, headers: true) do |row|


		end

	end
end