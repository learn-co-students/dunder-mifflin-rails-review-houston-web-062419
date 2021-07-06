class DogsController < ApplicationController

    before_action :current_dog, only: [:show,]

    def index
        @dogs = Dog.all
    end

    def show
        @employees = @dog.employees
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def current_dog
        @dog = Dog.find(params[:id])
    end

end
