class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :clear_setting
  
  def clear_setting
  	$meta_title = nil
  	$meta_content = nil
  end
  
end
