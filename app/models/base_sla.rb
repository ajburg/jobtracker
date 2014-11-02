class BaseSla < ActiveRecord::Base
  validates_presence_of :quantity, :period, :name

  validates :period, inclusion: ['hours', 'days', 'hour', 'day']
  has_many :client_slas
end
