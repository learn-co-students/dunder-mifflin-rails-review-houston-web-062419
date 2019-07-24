class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end
    
    def create
        @employee = Employee.new(eparams)

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
        @employee = Employee.new(eparams)

        if @employee.valid?
            @employee = Employee.find(params[:id])
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end

    end
   
    private
    def eparams
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
    end

end
