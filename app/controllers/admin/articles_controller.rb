class Admin::ArticlesController < ApplicationController
  def index
  end

  def new
	 @Article = Article.new
  end

  def create
	article = Article.new(article_params)
	if article.save
		tag_ids = params[:article][:tag_ids]
	    tag_ids.shift
		tag_ids.each do |tag_id|
			tag = Tag.find(tag_id.to_i)
			@user.tags << tag #関連付ける
		end
		redirect_to edit_admin_article_path(article.id)
	else
		redirect_to admin_articles_path
	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
	def article_params
		params.require(:article).permit(:title,
										:lead,
										:content,
										:mv_path,
										:meta_title,
										:meta_keyword,
										:meta_description,
										:editor_id,
										:status,
										tag_ids: [])
	end
end
