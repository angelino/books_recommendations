# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

require_relative 'user_importer'
require_relative 'book_importer'
require_relative 'book_rating_importer'

# Import Users...
puts "#{Time.now} - Users' Import Initialized..."

initial_time = Time.now

user_importer = UserImporter.new("#{Rails.root}/db/BX-Users.csv")
users = user_importer.entries
User.import users, validate: false

final_time = Time.now

import_time = final_time.to_f - initial_time.to_f

puts "#{Time.now} - Users' Import Finished in #{import_time} seconds"

# Import Books...
puts "#{Time.now} - Books' Import Initialized..."

initial_time = Time.now

book_importer = BookImporter.new("#{Rails.root}/db/BX-Books.csv")
books = book_importer.entries
Book.import books, validate: false

final_time = Time.now

import_time = final_time.to_f - initial_time.to_f

puts "#{Time.now} - Books' Import Finished in #{import_time} seconds"

# Import Ratings...
puts "#{Time.now} - Book Ratings' Import Initialized..."

initial_time = Time.now

book_rating_importer = BookRatingImporter.new("#{Rails.root}/db/BX-Book-Ratings.csv")
ratings = book_rating_importer.entries
puts "#{Time.now} - Arquivo de BX-Book-Ratings.csv lido"
BookRating.import ratings, validate: false

final_time = Time.now

import_time = final_time.to_f - initial_time.to_f

puts "Book Ratings' Import Finished in #{import_time} seconds"
