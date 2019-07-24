class EmployeesController < ApplicationController

    before_action :current_emp, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end

    def show
        # @employee = Employee.find(params[:id])
        @doggy = @employee.dog
    end

    def new
        @employee = Employee.new
        @doggy = Dog.all
        # gives form to create new employee
    end

    def create
        @emp = Employee.new(emp_params)

        if @emp.valid?
            @emp.save
            redirect_to @emp
        else
            flash[:errors] = @emp.errors.full_messages
            redirect_to new_employee_path
        end
        
    end

    def edit
        @doggy = Dog.all
        # @employee = Employee.find(params[:id])
    end

    def destroy
        # @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    def update
        # @employee = Employee.find(params[:id])
        @employee.update(emp_params)
        redirect_to @employee
    end

    private
    def emp_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

    def current_emp
        @employee = Employee.find(params[:id])
    end

    
end
