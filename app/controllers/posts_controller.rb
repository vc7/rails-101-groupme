class PostsController < ApplicationController
	def new
		@group = Group.find(params[:group_id])
		# using collection proxy method `build` will add the result back to `posts` collection
		# http://stackoverflow.com/a/4954542/1583560
		@post = group.posts.build 
	end
end
