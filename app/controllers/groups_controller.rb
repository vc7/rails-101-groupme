class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	# GET groups/:id with show action
	def show
		@group = Group.find(params[:id])
	end

	# GET
	# display the add group view
	def new
		@group = Group.new
	end

	# create action
	def create
		@group = Group.new(group_params)
		@group.save
		redirect_to groups_path # return to the group's index page
	end

	private

	def group_params
		params.require(:group).permit(:title, :description)
	end

end
