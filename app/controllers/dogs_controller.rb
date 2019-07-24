class DogsController < ApplicationController
	def index
		@dogs = Dog.all
		@dogs = @dogs.sort_by{|c| c.employees.count}
	end

	def show
		@dog = Dog.find(params[:id])

		@employees = @dog.employees
	end
end
