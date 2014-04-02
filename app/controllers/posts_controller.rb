# encoding: utf-8
class PostsController < ApplicationController

        before_filter :get_posts

        def index
        		
        		$meta_title = "Q&A"
        		        
                @post = Post.new
        
                respond_to do | format |
                        format.html { render "posts/#{I18n.locale.to_s}_index" }
                end
        
        end
        
        def create
        
            @post = Post.new(params[ :post ])
            
            @post.status = 'enable' if @post.status == '0'
              
            respond_to do | format |
                    if  verify_recaptcha && @post.save
                    		#PostMailer.send_notify( @post ).deliver
                    		#PostMailer.send_thank( @post ).deliver
                            format.html { redirect_to qa_path, :notice => '留言已建立' }
                    else
                    
                    		flash[ :warning ] = ( @post.errors.full_messages.any? ? t( 'errors.form.validation' ) : t( 'errors.form.captcha' ) )
                            format.html { render "posts/#{I18n.locale.to_s}_index" }
                    end
            end
        
        end

private
        def get_posts
                @posts = Post.where( 'NOT ISNULL( response_user_id )' ).order( "created_at DESC" )
        end

end