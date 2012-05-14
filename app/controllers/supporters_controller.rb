class SupportersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.view_type = "supporter"

    if @user.save
      flash[:success] = "Thank you for signing up."
      redirect_to new_supporter_company_path(@user)
    else
      render :new
    end
  end

end
