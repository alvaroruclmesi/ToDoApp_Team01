class UsersController < ApplicationController
    
    def destroy
        @user = User.find(current_user.id)
        if @user.destroy_with_password(user_params)
            redirect_to root_url, notice: "User deleted."
        else
            redirect_to users_url
            flash[:notice] = "Couldn't delete"
        end
    end
    
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password,
                                          :password_confirmation, :current_password)
    end
  end