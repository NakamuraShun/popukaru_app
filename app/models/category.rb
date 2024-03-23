class Category < ApplicationRecord
	has_many :articles

	validates :label, presence: true, length: {maximum: 10}
end
