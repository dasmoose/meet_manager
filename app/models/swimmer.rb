class Swimmer < ActiveRecord::Base
  belongs_to :team
  attr_accessible :first_name, :last_name, :team, :checked_in
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :team, presence: true
  
end
