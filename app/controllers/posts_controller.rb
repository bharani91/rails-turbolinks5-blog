class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
    fresh_when etag: @posts.pluck(:updated_at).max
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    fresh_when etag: @post.updated_at
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post created successfully" }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post updated successfully" }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
