class SupportersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.view_type = "supporter"

    if @user.save
      sign_in(@user)
      flash[:success] = "Thank you for signing up."
      redirect_to new_company_path
    else
      render :new
    end
  end

end
