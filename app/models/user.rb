class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :display_name, :display_name_lower,
  	:length => {:minimum => 1, :maximum => 64}

  # validates :email, :presence => true, 
  #                   :length => {:minimum => 3, :maximum => 254},
  #                   :uniqueness => true,
  #                   :format => {:with => /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\Z/i}
	validates :email, presence: true, 
	    length: {minimum: 3, maximum: 254},
	    uniqueness: true,
	    format: {with: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Z‌​a-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\Z/i}

  validates :display_name_lower, uniqueness: true
end
