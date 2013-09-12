# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  if Rails.env.production?      
          devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  else
          devise :database_authenticatable, :registerable,
                 :recoverable, :rememberable, :trackable, :validatable
  end
  
  before_save :initial_attributes
  
  has_many :posts
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
#  validates_presence_of :password, :message => '密碼不得空白'
  
  validates :email,     :uniqueness => true,
                                  :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => 'E-Mail 格式不符'  }
  
  validates_uniqueness_of :email, :message => 'E-Mail 已有人使用。'
  
  # attr_accessible :title, :body
  
  def change_auth( auth )  
        self.auth = auth  
  end
  
  def change_status( status )  
        self.status = status  
  end

  
private
        def initial_attributes
                self.auth ||= 'default'
                self.status ||= 'enable'                
        end
  
  
end