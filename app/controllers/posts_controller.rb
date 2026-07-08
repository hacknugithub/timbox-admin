class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    raw_posts = JsonPlaceholder::Client.list_posts.last(10)
    @posts = raw_posts.map { |post_data| Post.new(post_data) }

    @new_post = Post.new
  end

  def show
    render partial: 'post', locals: { post: @post }
  end

  def edit
  end

  def create
    response = JsonPlaceholder::Client.create_post(post_params)
    @post = Post.new(response)

    respond_to do |format|
      format.turbo_stream
      #Fallback strategy
      format.html { redirect_to posts_path, notice: "Post created successfully." }  
    end
  end

  def update
    response = JsonPlaceholder::Client.update_post(@post.id, post_params.to_h)
    @post = Post.new(response)

    render partial: 'post', locals: { post: @post }
  end

  def destroy
    response = JsonPlaceholder::Client.delete_post(@post.id)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(@post)) }
       #Fallback strategy
      format.html { redirect_to posts_path, notice: "Post deleted successfully." }
    end
  end

  private
  
  def set_post
    raw_post = JsonPlaceholder::Client.find_post(params[:id])
    @post = Post.new(raw_post) if raw_post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end