class CitiesController < ApplicationController
    def index
        @cities = City.page(params[:page]).per(25)
        @city = City.new
    end

    def create 
        @city = City.new(city_parameters)
        if @city.save
            redirect_to  cities_path
        else 
            render :index
        end
    end

    def destroy
        City.destroy(params[:id])
        redirect_to cities_path
    end


    private


    def city_parameters
        params.require(:city).permit(:name, :governorate_id)
    end
end
