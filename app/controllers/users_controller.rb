class UsersController < ApplicationController
  
  def new_user
  end

  def list_user
    @users_data = UserService.new.all_users session[:access_token]
  end

  def create
    @user = UserCreateService.new(user_params,session[:access_token]).create_user
    @user_local = User.new
    @user_local.email = @user["email"]
    @user_local.first_name = @user["first_name"]
    @user_local.last_name = @user["last_name"]
    @user_local.user_type = @user["type"]
    @user_local.zoom_user_id = @user["id"]
    @user_local.password = "password"
    byebug
    respond_to do |format|
      if @user_local.save
        format.html { redirect_to users_list_user_path, notice: 'User was successfully Created.' }
      end
    end
  end

  def update_user
  end

  def get_user
  end

  def delete_user 
    UserService.new.delete_user params["user_id"],session[:access_token]
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :type)
    end
end
