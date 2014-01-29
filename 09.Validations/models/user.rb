class User < ActiveRecord::Base
	has_many :recipes, dependent: :destroy
	validates :name, :email, presence: true
	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "Entrer un format d'e-mail valide !" }
end