class StaticPagesController < ApplicationController
		def show
			
			$meta_title = t( "static_pages.title." + params[ :pagename ] )
			
			@pagename = params[ :pagename ]
		
			respond_to do | format |
				format.html { render @pagename }
			end
		
		end

        def index
                
                respond_to do | format |
                        format.html { render :layout => false  }
                end
                
        end
end