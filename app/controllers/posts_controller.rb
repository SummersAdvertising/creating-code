# encoding: utf-8
class PostsController < ApplicationController

        before_filter :get_posts

        def index
                @post = Post.new
        
                respond_to do | format |
                        format.html
                end
        
        end
        
        def create
        
                @post = Post.new(params[ :post ])
                
                @post.status = 'enable' if @post.status == '0'
                  
                respond_to do | format |
                        if  @post.save
                        		PostMailer.send_notify( @post ).deliver
                        		PostMailer.send_thank( @post ).deliver
                                format.html { redirect_to posts_path, :notice => '留言已建立' }
                        else                          
                        		flash[ :warning ] = ( @post.errors.full_messages.any? ? '請重新檢查欄位。' : '請輸入正確的驗證碼。') 
                                format.html { render :index }
                        end
                end
        
        end

private
        def get_posts
                @posts = Post.where( 'NOT ISNULL( response_user_id )' ).order( "created_at DESC" )
        end

end