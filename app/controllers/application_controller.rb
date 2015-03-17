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
  
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    admin_posts_path
  end


end
