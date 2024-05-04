class Forms::Admin::ArticleForm < Forms::FormBase

	attr_accessor :article

	delegate :id, :persisted?, to: :article

	# 対象のモデルと属性を定義 
	def initialize(attributes: nil, article: nil)
		@article = article || Article.new
		super(attributes: attributes)
	end

	# 対象のモデルに属性をセット
	def article_attributes=(other)
		article.attributes = other
	end

	
	private

	def default_attributes
		{
			article: article,
		}
	end

	# 保存処理(データの永続化)
	def persist
		raise ActiveRecord::RecordInvalid if article.invalid? #invalid?の返り値はbooleanなので例外を発生させてる

		ActiveRecord::Base.transaction do
			article.save!
			article.mv_image.purge if delete_mv_image?
		end

		true
	rescue ActiveRecord::RecordInvalid
		errors_from_article

		false
	end

	# articleが知るバリデーションエラーの内容をArticleFormと共有する
	def errors_from_article
		article.errors.each do |error|
			errors.add(:base, error.full_message)
		end
	end


	def delete_mv_image?
		article.mv_image_delete_flg == '1'
	end



	def self.status_options
		[
			['公開', Article::STATUS__PUBLIC],
			['非公開', Article::STATUS__PRIVAYE],
			['下書き', Article::STATUS__DRAFT],
		]
	end

end