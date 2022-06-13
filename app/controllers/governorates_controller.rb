class GovernoratesController < ApplicationController
    def index
        @govermorates_and_its_cities = Governorate.govermorates_and_its_cities 
        @governorates = Governorate.all 
        @governorate = Governorate.new
    end

    def create  
        @governorate = Governorate.new(governorate_parameters)
        if  @governorate.save 
            redirect_to governorates_path
        else 
            render :index
        end  
    end

    private

    def governorate_parameters 
        params.require(:governorate).permit(:name)
    end  
end
