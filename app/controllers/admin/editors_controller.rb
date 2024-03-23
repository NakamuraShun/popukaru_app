class Admin::EditorsController < ApplicationController
	def index
		@Editors = Editor.all
	end

	def new
		@Editor = Editor.new
	end

	def create
		editor = Editor.new(editor_params)
		if editor.save
			redirect_to admin_editors_path
		else
			redirect_to admin_editors_path
		end
	end

	def update
	end

	def destroy
		editor = Editor.find(params[:id])
		editor.delete
		redirect_to admin_editors_path
	end

	private
	def editor_params
		params.require(:editor).permit(:first_name,
										:last_name,
										:first_name_ruby,
										:last_name_ruby,
										:birthday,
										:thumb_path,
										:organization,
										:position,
										:lead,
										:introduction)
	end
end
