# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post deleted!'
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url, notice: 'Post updated!'
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
