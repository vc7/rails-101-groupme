class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	# GET groups/:id with show action
	def show
		@group = Group.find(params[:id])
		@posts = @group.posts # fetch posts by given group
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

	# Display edit view
	def edit
		@group = Group.find(params[:id])
	end

	# process the updated data from edit view
	def update
		@group = Group.find(params[:id])

		if @group.update(group_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	# destroy a group
	def destroy
		@group = Group.find(params[:id])

		@group.destroy

		redirect_to groups_path
	end
	

	private

	def group_params
		params.require(:group).permit(:title, :description)
	end

end
