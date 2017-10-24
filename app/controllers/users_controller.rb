class UsersController < ApplicationController

  def create
    @user = User.new(reg_helper)
    if @user.save
      session[:user_id] = @user.id
      redirect_to shoes_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_path
    end
  end

  private
   def reg_helper
     params.require(:reg).permit(:first_name, :last_name, :email, :password) if params[:reg].present?
   end

   def check_user
     unless current_user.id.to_s == params[:id]
      redirect_to shoes_path
    end
  end


end
