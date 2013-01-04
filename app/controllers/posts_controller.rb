class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(convert_to_hash(params[:post]))

    respond_to do |format|
      format.html{ redirect_to post_path(@post) }
      format.json{ render json: @post }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def convert_to_hash(value)
    return value if value.kind_of?(Hash)
    JSON.parse(value)
  end
end
