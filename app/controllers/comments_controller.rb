class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: [:create]


  def create
    @comment = @post.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "Comment created successfully"
        format.html { redirect_to @post }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
  end

  def cancel_editing
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = "Comment updated successfully"
        format.html { redirect_to @post }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
  end

private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
