class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic=>true

  validates :address, :city, :state, :zipcode, :presence=>true
end
