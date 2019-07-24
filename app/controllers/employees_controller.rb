class EmployeesController < ApplicationController
    def index
    @employees = Employee.all
    end

    def new
    @employee = Employee.new
    # @employee.first_name = params(first_name: :first_name)
    # @employee.last_name = params(last_name: :last_name)
    # @employee.alias = params(alias: :alias)
    # @employee.title = params(title: :tite)
    # @employee.department = params(department: :department)
    # @employee.img_url = params(img_url: :img_url)
    # @employee.dog_id = params(dog_id: :dog_id)
    # @employee.save
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

    def eparams
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
    end
end
