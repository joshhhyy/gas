class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:index, :destroy]
  helper UsersHelper

  # GET /users
  # GET /users.json
  def index
    @group = Group.find params[:group_id]

    if params[:search_users]
      @users = User.search(params[:search_users]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def search  
    if params[:commit] == "Find User"
      @users = User.search( params[:search] )
      render :index
    else
      @posts = Post.search( params[:search] )
      render :search
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @group = Group.find params[:group_id]
    gon.user = User.find(params[:id])
    # @post = Post.find params[:post_id]
  end

  # GET /users/new
  def new
    @group = Group.find params[:group_id]
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @group = Group.find params[:group_id]
  end

  # POST /users
  # POST /users.json
  def create
    @group = Group.find params[:group_id]
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to [@group, @user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @group = Group.find params[:group_id]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@group, @user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @group = Group.find params[:group_id]
    @user.destroy
    respond_to do |format|
      format.html { redirect_to group_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :tagline, :email, :avatar, :last_active, :alumni, :admin, :password, :password_confirmation, :group_id, :github_username, :linkedin_profile, :twitter_username, :slack_username)
    end
end
