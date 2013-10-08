class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable
  # Setup accessible or protected atributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :pins
end
