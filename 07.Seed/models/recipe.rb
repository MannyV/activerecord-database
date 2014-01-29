class Recipe < ActiveRecord::Base
  attr_accessor :name, :description, :length, :difficulty, :rating
  
end