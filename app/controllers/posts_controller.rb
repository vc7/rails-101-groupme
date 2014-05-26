class PostsController < ApplicationController

	before_action :find_group

	def new
		# using collection proxy method `build` will add the result back to `posts` collection
		# http://stackoverflow.com/a/4954542/1583560
		@post = @group.posts.build 
	end

	def create
		@post = @group.posts.new(post_params)

		if @post.save
			redirect_to group_path(@group)
		else
			render :new
		end
	end

	def edit
		@post = @group.posts.find(params[:id]) # :id is a post id
	end

	def update
		@post = @group.posts.find(params[:id])

		if @post.update(post_params)
			redirect_to group_path(@group)
		else
			redirect_to :edit
		end
	end

	def destroy
		@post = @group.posts.find(params[:id])

		@post.destroy

		redirect_to group_path(@group)
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end

	def find_group
		@group = Group.find(params[:group_id])
	end
end
