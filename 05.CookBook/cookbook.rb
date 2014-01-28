require_relative 'config/application'
require './models/recipe'

# your program here

	puts "Salut Robuchon, what do you want to do today?"
	puts "1. create a recipe"
	puts "2. delete all recipes"
	puts "3. read your recipes"

	choice = gets.chomp.to_i

	if choice == 1
		puts "Please input the name of your recipe"
		name = gets.chomp
		puts "Please input its description"
		description = gets.chomp
		puts "Please input its length"
		length = gets.chomp.to_i
		puts "Please input its difficulty"
		difficulty = gets.chomp.to_i
		
		recipe = Recipe.create(name: name, description: description, length: length, difficulty: difficulty)

	elsif choice == 2
		Recipe.delete_all()
		puts "Done!"
	  
	elsif choice == 3
		puts Recipe.all

	else
	  puts "i did not understand"
	  
	end