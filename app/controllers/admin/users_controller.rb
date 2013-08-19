# encoding: utf-8
class Admin::UsersController < AdminController

        def index
        
                @users = User.all
                
                @user = User.new
                
                respond_to do | format |
                        
                        format.html {  }
                        
                end
                
        
        end
        
        def show
                respond_to do | format |
                        format.html { redirect_to admin_users_path }
                end
        end
        
        def new
        
        end
        
        def edit
                @user = User.find( params[ :id ] )
                
                respond_to do | format |
                        format.html {  }
                end
                
        
        end
        
        def create
        
                @user = User.new( params[ :user ] )
        
                respond_to do | format |
                        if @user.save
                                format.html { redirect_to admin_users_path, :notice => '新增使用者成功' }
                        else
                                @users = User.all
                                format.html { render :index }
                        end
                end
        
        end

        def update
                
                @user = User.find( params[ :id ] )
        
                if params[:user][:password].blank?
                        params[:user].delete(:password)
                        params[:user].delete(:password_confirmation)
                end
                
                if @user.auth != params[:user][:auth]
                        @user.change_auth( params[ :user ][ :auth ] )
                end
                
                if @user.status != params[:user][:status]
                        @user.change_status( params[ :user ][ :status ] )
                end
                params[:user].delete( :status )
                params[:user].delete( :auth )
        
                respond_to do | format |
                        if @user.update_attributes( params[ :user ] )
                                format.html { redirect_to admin_users_path }
                        else
                                format.html { render :edit }
                        end
                        
                
                end
        
        end
        
        def destroy
                @user = User.find( params[ :id ] )
                
                @user.destroy
                respond_to do | format |
                        format.html { redirect_to admin_users_path,  :notice => '使用者刪除成功' }
                end
                
        end


end