class Article < ApplicationRecord
  belongs_to :category
  belongs_to :editor
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations

	# 公開状態
	STATUS__PUBLIC  = 1 # 公開
	STATUS__PRIVAYE = 2 # 非公開
	STATUS__DRAFT   = 3 # 下書き

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
	# validates :slider_flg,         presence: true, numericality: { only_integer: true }
	# validates :slider_order,       presence: true, numericality: { only_integer: true }
	# validates :pickup_flg,         presence: true, numericality: { only_integer: true }
	# validates :pickup_order,       presence: true, numericality: { only_integer: true }

	validate :validate_check_public_datetime,  if: :public_datetime
	validate :validate_check_private_datetime, if: :private_datetime

	private

	def validate_check_public_datetime
		errors.add(:public_datetime, "は現在の日時より後の日時にしてください") unless public_datetime < Time.now
	end

	def validate_check_private_datetime
		if public_datetime
			errors.add(:private_datetime, "は非公開日時は公開日時より後の日時にしてください") unless public_datetime < private_datetime
		else
			errors.add(:private_datetime, "は現在の日時より後の日時にしてください") unless private_datetime < Time.now
		end
	end

end
