class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores 
  validates :name, :presence => true
  before_save :titleize_name

private

  def titleize_name
    self.name=(name().titleize())
  end
end
