class Article < ApplicationRecord
	belongs_to :category
	belongs_to :editor
	has_many :article_tag_relations
	has_many :tags, through: :article_tag_relations

	has_one_attached :mv_image do |attachable|
		attachable.variant :thumb, resize_to_limit: [200, 200]
	end

	# 公開状態
	STATUS__PUBLIC  = 1 # 公開
	STATUS__PRIVAYE = 2 # 非公開
	STATUS__DRAFT   = 3 # 下書き

	IMAGE_PATH_DEFAULT_MV_IMAGE = 'default/default_article_mv_image.jpg'

	validates :title,              presence: true, length: { maximum: 50 }
	validates :lead,               presence: true, length: { maximum: 500 }
	validates :content,            presence: true
	validates :mv_path,            presence: true
	validates :meta_title,         presence: true
	validates :meta_keyword,       presence: true
	validates :meta_description,   presence: true
	validates :category_id,        presence: true, numericality: { only_integer: true }
	validates :editor_id,          presence: true, numericality: { only_integer: true }
	validates :status,             presence: true, numericality: { only_integer: true }
	validates :slider_order,       presence: false, numericality: { only_integer: true }
	validates :pickup_order,       presence: false, numericality: { only_integer: true }

	validate :validate_check_public_datetime,  if: :public_datetime
	validate :validate_check_private_datetime, if: :private_datetime

	# MV画像
	def mv_image_path
		mv_image.attached? ? mv_image : IMAGE_PATH_DEFAULT_MV_IMAGE
	end

	# MV画像 (サムネ用)
	def mv_image_thumb_path
		mv_image.attached? ? mv_image.variant(:thumb) : IMAGE_PATH_DEFAULT_MV_IMAGE
	end

	private

	def validate_check_public_datetime
		errors.add(:public_datetime, "は現在の日時より後の日時にしてください") unless  Time.now < public_datetime
	end

	def validate_check_private_datetime
		if public_datetime
			errors.add(:private_datetime, "は非公開日時は公開日時より後の日時にしてください") unless public_datetime < private_datetime
		else
			errors.add(:private_datetime, "は現在の日時より後の日時にしてください") unless Time.now < private_datetime
		end
	end

end
