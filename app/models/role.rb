class Role < ActiveRecord::Base
  validates_presence_of :user_role
  has_many :users
end
