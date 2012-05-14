class CompaniesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user

  def new
    @company = Company.new
    @address = @company.build_address
  end

  def create
   @company = Company.new(params[:company])
   @company.company_type = @user.view_type

    if @company.save
      flash[:success] = "Thank you for signing up. Your dashboard is where you will perform all of your actions."
      redirect_to dashboard_path
    else
      render :new
    end
 
  end

  protected

  def load_user
    if params[:provider_id]
      id = params[:provider_id]
    elsif params[:supporter_id]
      id = params[:supporter_id]
    elsif params[:user_id]
      id = params[:user_id]
    end

    if id
      @user = User.find(id)
    else
      flash[:notice] = "Please add a company as a registered user."
      redirect_to root_path and return false
    end
  end
end
