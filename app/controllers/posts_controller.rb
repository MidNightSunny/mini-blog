class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show

  end
  

  def create
    Post.create(post_params)
    redirect_to 'http://localhost:3000/'
    binding.pry
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
       post.destroy 
       redirect_to("http://localhost:3000/")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content: params[:content])
    redirect_to("http://localhost:3000/")
  end
  
  private
   def post_params
     params.require(:post).permit(:content).merge(user_id:current_user.id)
   end

end
