class Admin::HomeController < ApplicationController
  def index
	redirect_to admin_articles_path
  end
end
