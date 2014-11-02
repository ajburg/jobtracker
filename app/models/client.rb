class Client < ActiveRecord::Base

validates_presence_of :name, :wfm_id


has_many :jobs
has_many :client_slas

end
