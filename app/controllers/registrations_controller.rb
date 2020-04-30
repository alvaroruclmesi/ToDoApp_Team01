class RegistrationsController < Devise::RegistrationsController
    #before_action :authenticate_user!, only: [:update]
    
    def destroy
      
      if resource.destroy_with_password(:current_password)
        redirect_to root_url, notice: "User deleted."
      else
        redirect_to edit_user_registration_path
        flash[:notice] = "Couldn't delete. Password incorrect or not introduced"
      end
    end

    private
  
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
    end

    def account_delete_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
    end
end