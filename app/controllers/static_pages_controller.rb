class StaticPagesController < ApplicationController
		def show
			
			$meta_title = t( "static_pages.title." + params[ :pagename ] )
			
			@pagename = params[ :pagename ]
		
			respond_to do | format |
				format.html { render 'static_pages/' + I18n.locale.to_s + '/' + @pagename }
			end
		
		end

        def index
                
                $meta_title = t( "static_pages.title.index" );
                
                respond_to do | format |
                	if params[ :locale ].nil?
                		format.html { render :layout => false, :template => 'static_pages/index'  }
                	else
                        format.html { render :layout => false, :template => 'static_pages/' + I18n.locale.to_s + '/index'  }
                    end
                end
                
        end
end