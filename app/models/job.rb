class Job < ActiveRecord::Base

  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

end
