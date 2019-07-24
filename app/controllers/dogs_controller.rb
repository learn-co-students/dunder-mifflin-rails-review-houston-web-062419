class DogsController < ApplicationController
    def index
    @dogs = Dog.all
    # byebug 
    end

    def show
    @dog = Dog.find(params[:id])
    # byebug
    end

    def sort
        @dogs = Dog.all
        @dogs = @dogs.sort_by{ |c| c.employees.count }
    end

end
