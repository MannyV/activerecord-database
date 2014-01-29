require_relative 'config/application'
require './models/recipe'
require './models/user'

# your code here to query the database
puts "There are in #{User.count} users in the cookbook"


# finds all the recipes that contain

User.all.each do |user|
	puts user	
  	puts user.recipes
  	puts "---------------------"
end

masterchef = User.find(Recipe.group("user_id").order("avg(difficulty) DESC").first.user_id)
puts "The masterchef is #{masterchef}"