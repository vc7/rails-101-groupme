class PostsController < ApplicationController
	def new
		@group = Group.find(params[:group_id])
		# using collection proxy method `build` will add the result back to `posts` collection
		# http://stackoverflow.com/a/4954542/1583560
		@post = @group.posts.build 
	end

	def create
		@group = Group.find(params[:group_id])
		@post = @group.posts.new(post_params)

		if @post.save
			redirect_to group_path(@group)
		else
			render :new
		end
	end

	def edit
		@group = Group.find(params[:group_id])
		@post = @group.posts.find(params[:id]) # :id is a post id
	end

	def update
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end
end
