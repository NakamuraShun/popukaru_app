class Forms::Admin::ArticleForm < Forms::FormBase

	attr_accessor :article, :tag

	delegate :id, :persisted?, to: :article

	# 対象のモデルと属性を定義 
	def initialize(attributes: nil, article: nil, tag: nil)
		@article = article || Article.new
		@tag = tag || Tag.new
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





	def self.status_options
		[
			['公開', Article::STATUS__PUBLIC],
			['非公開', Article::STATUS__PRIVAYE],
			['下書き', Article::STATUS__DRAFT],
		]
	end

	# def save
	# 	return if invalid?

	# 	# tag_ids = params[:article][:tag_ids]
	#     # tag_ids.shift
	# 	# tag_ids.each do |tag_id|
	# 	# 	tag = Tag.find(tag_id.to_i)
	# 	# 	@article.tags << tag #関連付ける
	# 	# end

	# end


end