require 'sqlite3'

# creates the database
db_path = "db/cookbook.sqlite"
db = SQLite3::Database.new(db_path)

# creates the schema of the database
# your code here
sql = %q{ CREATE TABLE IF NOT EXISTS Recipes (
	Id integer primary key autoincrement,
	Name varchar(255),
	Description varchar(255),
	Length int,
	Difficulty int,
	)  
}

begin
	db.execute(sql)
	puts "Welcome!"
rescue
	 puts "Welcome back!"
end
#*************************************

# function to create a recipe


def create_recipe(db,name,description,length,difficulty)
  db.execute("INSERT INTO Recipes (Name, Description, Length, Difficulty)
			VALUES ('#{name}','#{description}','#{length}','#{difficulty}')")
end

# function to delete a recipe
def delete_recipe(db,id)
  db.execute("DELETE FROM Recipes
			WHERE Id = '#{id}'")
end

# function to delete all recipes
def delete_all_recipes(db)
  db.execute("DELETE FROM Recipes")
end

# function to update a recipe
def update_recipe(db,id,description)
  db.execute("UPDATE Recipes
  			SET description='#{description}'
			WHERE Id = '#{id}'")
end

def get_recipes(db)
    db.execute("SELECT *
  			FROM Recipes").each { |row| puts "- Recette : #{row[1]} - #{row[2]} (preparation : #{row[3]} minutes, difficulty #{row[4]}/3)"}
end


#*************************************

# program
while true

	puts "Salut Robuchon, what do you want to do today?"
	puts "1. create a recipe"
	puts "2. delete all recipes"
	puts "3. read your recipes"
	puts "0. exit"

	choice =  gets.chomp.to_i

	break if choice == 0

	if choice == 1
		puts "Please input the name of your recipe"
		name = gets.chomp
		puts "Please input its description"
		description = gets.chomp
		puts "Please input its length"
		length = gets.chomp.to_i
		puts "Please input its difficulty"
		difficulty = gets.chomp.to_i
	 	
	 	create_recipe(db, name, description, length, difficulty)
	  
	elsif choice == 2
	 	
	 	delete_all_recipes(db)
	  
	elsif choice == 3
	  	
	  	get_recipes(db)

	end
  
end
  
  
  
  
  
  
  