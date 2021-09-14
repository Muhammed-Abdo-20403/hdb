class UsersController < ApplicationController
    before_action :authenticate_user!


    private 

    def user_pramaters
        params.require(:add_name_to_users).permit(:name, :phone)
    end 
end
