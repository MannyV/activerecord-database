require_relative 'config/application'
require './models/recipe'

# query the database here
Recipe.all

# gets only the recipes with difficulty 3
puts Recipe.find_by(difficulty: "3")

# gets the top 10 difficult recipes
puts Recipe.order(difficulty: :desc).first(10)
