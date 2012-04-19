class ProvidersController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])

    if @company.save
      flash[:success] = "You have successfully added a company."
      redirect_to new_provider_user_path(@company)
    else
      render :new
    end
  end

end
