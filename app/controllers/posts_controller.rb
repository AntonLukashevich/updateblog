class PostsController < ApplicationController
	def index
		@posts = Post.includes(:user)
	end

	def new
		@user = current_user
		@post = Post.new
	end

	def show
		@user = current_user
		@post = Post.includes(:user).find(params[:id])
	end

	def edit
		@user = current_user
		@post= Post.includes(:user).find(params[:id])
	end

	def update
		@user = current_user
		@post = Post.includes(:user).find(params[:id])
		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def create
		@user = current_user
		@post = @user.posts.new(post_params)

		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def destroy
		@user = current_user
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end
