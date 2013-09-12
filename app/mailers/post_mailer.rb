# encoding: utf-8
class PostMailer < ActionMailer::Base
  default from: "\"創碼公司\" <adwords@summers.com.tw>"

  def send_notify( post )
  	@post = post
  	@user_mails = User.pluck( :email )
  	mail( :to => @user_mails, :subject => '[創碼公司] 收到了來自使用者的詢問。' ) do | format |
  		format.html { render 'notify' }
  	end
  	
  	
  
  end
  
  def send_thank( post )
  	@post = post  	
  	mail( :to => [@post.contact_email], :subject => '創碼公司感謝您的留言！' ) do | format |
  		format.html { render 'thank' }
  	end
  
  end
  
  def send_response( post )
  	@post = post
  	
  	mail( :to => [@post.contact_email], :subject => '您在創碼公司的問題得到了答覆！' ) do | format |
  		format.html { render 'response' }
  	end
  	
  end
  
end
