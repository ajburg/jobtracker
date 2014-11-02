class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates_presence_of :first_name, :last_name, :email, :mobile, :role_id


  validates_format_of :email,
    :with  => Devise.email_regexp,
    :allow_blank => true,
    :if => :email_changed?


  belongs_to :role
end
