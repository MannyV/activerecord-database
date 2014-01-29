require_relative 'config/application'
require './models/recipe'
require './models/user'

# your code here to query the database

recipe = Recipe.new(name: "Yo", difficulty: "6", user_id: 1)
recipe.save!
user = User.create(name: "name", email:"manqsqsd")
user.save!