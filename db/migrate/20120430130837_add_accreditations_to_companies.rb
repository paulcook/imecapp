class AddAccreditationsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :accreditations, :string

  end
end
