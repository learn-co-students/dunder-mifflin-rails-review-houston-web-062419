class EmployeesController < ApplicationController

    before_action :current_employee, only: [:show, :edit, :update, :destroy]
    def index
        @employees = Employee.all
    end

    def show
        @dog = @employee.dog

    end

    def new
        @employee = Employee.new
        @dog = Dog.all
    end
    
    def create
        @employee = Employee.new(employee_params)

        if @employee.valid?
            @employee.save
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end

    end

    def edit
        @dog = Dog.all
        
    end

    def update
        @employee.update(employee_params)
        redirect_to @employee
    end

    def destroy
        @employee.destroy
        redirect_to employee_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
    end
    
    def current_employee
        @employee = Employee.find(params[:id])
    end
end
