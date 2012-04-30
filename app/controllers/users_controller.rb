class UsersController < ApplicationController

  before_filter :load_company

  def new
    @user = @company.users.build(:view_type=>@company.company_type)
  end

  def create
    @user = @company.users.build(params[:user])

    if @user.save
      flash[:success] = "You have completed your registration. Thank You!"
      redirect_to  dashboard_path
    else
      render :new
    end
  end

  protected

  def load_company
    if params[:provider_id]
      @company = Company.find(params[:provider_id])
    elsif params[:supporter_id]
      @company = Company.find(params[:supporter_id])
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
    else
      flash[:notice] = "Please add new users to a company. If your company is already registered an administrator of your company account can add you to the company."
      redirect_to  root_path and return false
    end 
  end
end
