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
      @user.company = @company
      @user.save

      flash[:success] = "Thank you for signing up. Your dashboard is where you will perform all of your actions."
      redirect_to dashboard_path
    else
      render :new
    end
 
  end

  protected

  def load_user
    @user = current_user
  end
end
