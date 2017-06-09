class UsersController < ApplicationController

  def show
    @user=current_user
  end
  def edit
    @user= current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to action: :users
    else
         render "edit"
    end


  end
  private
    def user_params
      params.require(:users).permit(:first_name, :last_name)
    end
end
