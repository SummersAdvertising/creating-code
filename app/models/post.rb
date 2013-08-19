# encoding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :contact_phone, :content, :status, :title, :response, :response_user_id, :response_time
  
  validates_presence_of :contact_name, :content, :title
  validates :contact_email, :presence   => { :message => '聯絡信箱不得空白' },
                                                                                        :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => 'E-Mail 格式有誤' }
    
    before_save :initialize_attributes
    
private
        def initialize_attributes
                self.status ||=         'disable'
        end
    
  
end