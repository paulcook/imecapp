class ProvidersController < ApplicationController
  def new
    @user = User.new
    #@user.view_type = "provider"
  end

  def create
    @user = User.new(params[:user])
    @user.view_type = "provider"

    if @user.save
      flash[:success] = "Thank you for signing up."
      redirect_to new_provider_company_path(@user)
    else
      render :new
    end
  end

end
