require './models/recipe'
require './models/user'
require 'faker'
require 'nokogiri'
require 'open-uri'

# Seed you database with recipe data from marmiton
puts "Seeding database..."
# Here is a sample of ingredients (you are free to add some !)
ingredients = ["curry", "crevettes", "agneau", "pomme", "orange", "cafe", "asperges", "celeri", "dorade"]

# creates users with the Faker Gem
# for each user, pick randomly one ingredient or more from the list of ingredients and attach recipes to the user


(1..21).each do 
	difficulty = 1 + rand(2)
	user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
    doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredients[rand(9)]}&diff=#{difficulty}"))
	doc.search('.m_search_result').each do |element|
        name = element.search('.m_search_titre_recette > a').inner_text
        description = element.search('.m_search_result_part4').inner_text.strip
        length = description.match(/(\d+)/)[0].to_i
        rating = element.search('.etoile1').size
        Recipe.create(name: name, description: description, length: length, difficulty: difficulty, rating: rating, user_id: user.id)
    end
end