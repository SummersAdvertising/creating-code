# encoding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :contact_email, :contact_name, :contact_phone, :content, :status, :title, :response, :response_user_id, :response_time
  
  validates_presence_of :contact_name, :message => "請留下您的稱呼方式"
  validates_presence_of :content, :message => "請寫下您的問題"
  validates_presence_of :title, :message => "請註明您要問的問題標題"
  
  validates :contact_email, :presence   => { :message => '聯絡信箱不得空白' },
                                                                                        :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => 'E-Mail 格式有誤' }
  
  belongs_to :replier, :class_name => "User", :foreign_key => :response_user_id
    
    before_save :initialize_attributes
    
private
        def initialize_attributes
                self.status ||=         'disable'
        end
    
  
end