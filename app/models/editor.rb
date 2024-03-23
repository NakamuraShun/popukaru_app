class Editor < ApplicationRecord
	has_many :articles

	validates :first_name,           presence: true, length: { maximum: 15 }
	validates :last_name,            presence: true, length: { maximum: 15 }
	validates :first_name_ruby,      presence: true, length: { maximum: 15 }
	validates :last_name_ruby,       presence: true, length: { maximum: 15 }
	validates :birthday,             presence: true
	validates :thumb_path,           presence: true
	validates :organization,         presence: true, length: { maximum: 20 }
	validates :position,             presence: true, length: { maximum: 20 }
	validates :lead,                 presence: true, length: { maximum: 30 }
	validates :introduction,         presence: true, length: { maximum: 500 }

	def full_name
		first_name + last_name
	end

end
