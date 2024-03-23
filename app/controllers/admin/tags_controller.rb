class Admin::TagsController < ApplicationController
	def index
		@Tags = Tag.all
		@Tag = Tag.new
	end

	def create
		tag = Tag.new(tag_params)
		if tag.save
			redirect_to admin_tags_path
		else
			redirect_to admin_tags_path
		end
	end

	def update
	end

	def destroy
		tag = Tag.find(params[:id])
		tag.delete
		redirect_to admin_tags_path
	end

	private
	def tag_params
		params.require(:tag).permit(:label)
	end
end
