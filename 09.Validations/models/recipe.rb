class Recipe < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, uniqueness: true
	validates :difficulty, inclusion: { in: %w(1 2 3 4 5) }
end