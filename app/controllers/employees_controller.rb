class EmployeesController < ApplicationController
	def index
		@employees = Employee.all
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def create 
		@employee = Employee.new(e_params)
		if @employee.valid?
			@employee.save
			redirect_to employee_path(@employee)
		else
			flash[:errors] = @employee.errors.full_messages
			redirect_to new_employee_path
		end
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		# byebug
		@employee = Employee.new(e_params)

		if @employee.valid?
			@employee = Employee.find(params[:id])
			@employee.update(e_params)
			redirect_to employee_path(@employee)
		else
			flash[:errors] = @employee.errors.full_messages
			redirect_to edit_employee_path
		end

	end

	def e_params
		params.require(:employee).permit(:first_name, :last_name, :dog_id, :title, :alias, :office)
	end
end
