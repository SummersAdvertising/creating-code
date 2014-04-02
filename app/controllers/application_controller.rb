class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :clear_setting  
  before_filter :setup_locale
  
  layout :setup_layout
  
  def default_url_options(options={})  
    { :locale => I18n.locale }
  end  
  
  def setup_locale
  	
    I18n.t :missing, :default => '{Not here}'
    
  	if params[ :locale ]
  		I18n.locale = params[ :locale ]
  	end
  
  end
  
  def setup_layout
  	I18n.locale.to_s + '_application'
  end
  
  def clear_setting
  	$meta_title = nil
  	$meta_content = nil
  end
  
end
