class Admin::PostsController < AdminController
  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.page( params[:page] ).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PUT /admin/posts/1
  # PUT /admin/posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])      
      
        @post.response_user_id = current_user.id
        @post.response_time = Time.now
      
        @post.save
        
        # PostMailer.send_response( @post ).deliver
      
        format.html { redirect_to admin_posts_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end
end