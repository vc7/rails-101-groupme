class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	# GET groups/:id with show action
	def show
		@group = Group.find(params[:id])
	end
end
