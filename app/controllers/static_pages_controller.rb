class StaticPagesController < ApplicationController
		def show
			
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