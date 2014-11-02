class Lookup < ActiveRecord::Base
   validates_presence_of :name, :value, :lookup_type
end
