class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
    @posts = @user.posts
    gon.postContent = Post.pluck(:content)

    if params[:search_posts]
      @posts = Post.search(params[:search_posts]).order("created_at DESC")
    else
      @posts = @user.posts
    end
  end

  def search
    # params[:commit] will either be "Find User" or "Find Post"
    # if it is "Find Post"
      # Do this stuff
    # if it is "Find User"
    # if params[:commit] == "Find Post"
    #   @posts = Post.search( params[:search_posts] )
    #   render :search_page
    # else
      # @users = User.search( params[:search_users] )
      # redirect_to :controller => :users, :action => :index
      # render group_users_path( group, @cuuser )
    # end
  end



  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find params[:id]
    @post.content = @post.content.gsub('&lt;code&gt;', '<pre><code>').gsub('&lt;/code&gt;', '</pre></code>') if @post.content
    gon.postContent = @post.content
    @comment = Comment.new
    @comments = @post.comments
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
  end

  # GET /posts/new
  def new
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
  end

  # POST /posts
  # POST /posts.json
  def create
    # raise params.inspect
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if params[:post]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:post]['file'].path)
      @post.cl_id = cloudinary['public_id']
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to group_user_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
    if params[:post]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:post]['file'].path)
      @post.cl_id = cloudinary['public_id']
    end
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to group_user_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @group = Group.find params[:group_id]
    @user = User.find params[:user_id]
    @post.destroy
    respond_to do |format|
      format.html { redirect_to group_user_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params

      params.require(:post).permit(:title, :subtitle, :content, :tags, :created_at, :updated_at, :user_id, :cl_id, :search_post)

    end
end
