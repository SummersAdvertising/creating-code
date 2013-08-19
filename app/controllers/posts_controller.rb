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
        
                respond_to do | format |
                        if verify_recaptcha && @post.save
                                format.html { redirect_to posts_path, :notice => '留言已建立' }
                        else                            
                                format.html { render :index, :warning =>( verify_recaptcha ? '請重新檢查欄位。' : '請輸入正確的驗證碼。')  }
                        end
                end
        
        end

private
        def get_posts
                @posts = Post.where( :status => 'enable' ).order( :created => :desc )
        end

end