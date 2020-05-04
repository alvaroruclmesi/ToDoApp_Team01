class RegistrationsController < Devise::RegistrationsController
  #before_action :authenticate_user!, only: [:update]
  before_action :user_params, only: [:update]
    
  def update
    if params[:commit] == "Delete"
      #puts "JELLODAAAAAAH-" + params[:user][:current_password]
      if resource.destroy_with_password(params[:user][:current_password])
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        set_flash_message :notice, :destroyed
        yield resource if block_given?
        respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
      else
        redirect_to edit_user_registration_path
        flash[:danger] = "Can not delete. Password incorrect"
      end
    else
      super
    end
  end

  #def destroy
    
    #resource.destroy_with_password
    #Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    #set_flash_message :notice, :destroyed
    #yield resource if block_given?
    #respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }

    #if resource.destroy_with_password(current_user.current_password)
    #  redirect_to root_url, notice: "User deleted."
    #else
    #  redirect_to edit_user_registration_path
    #  flash[:notice] = "Couldn't delete. Password incorrect or not introduced"
    #end
  #end

  private

  def user_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  #def sign_up_params
  #  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  #end

  #def account_update_params
  #  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  #end

  #def account_delete_params
  #  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  #end
end