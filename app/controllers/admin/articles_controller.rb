class Admin::ArticlesController < ApplicationController

	before_action :target_article,   only: [:edit, :update, :destroy]

	def index
		@Articles = Article.all
	end

	def new
		@Form = Forms::Admin::ArticleForm.new
	end

	def edit
		@Form = Forms::Admin::ArticleForm.new(article: @target_article)
	end

	def create
		@Form = Forms::Admin::ArticleForm.new(attributes: article_form_params)
		if @Form.save
			redirect_to admin_article_path(:id), notice: "User was successfully created."
		else
			render :new, status: :unprocessable_entity
		end
	end

	def update
		@Form = Forms::Admin::ArticleForm.new(attributes: article_form_params, article: @target_article)
		if @Form.save
			redirect_to admin_article_path(:id), notice: "User was successfully created."
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@target_article.delete
		redirect_to admin_articles_path
	end

	private

	def article_form_params
		params.require(:forms_admin_article_form).permit(article_attributes: [
																	:title,
																	:lead,
																	:content,
																	:status,
																	:mv_path,
																	:meta_title,
																	:meta_keyword,
																	:meta_description,
																	:public_datetime,
																	:private_datetime,
																	:category_id,
																	:editor_id,
																	:mv_image,
																	:mv_image_delete_flg,
																	tag_ids: []]
																)
	end

	def target_article
		@target_article = Article.find(params[:id])
	end
end
