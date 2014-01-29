# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

require_relative 'user_importer'

# Import Users...
user_importer = UserImporter.new("#{Rails.root}/db/users_sample.csv")

user_importer.entries.each do |user|
  puts "User #{user.inspect} imported!" if user.save
end

# Import Books...
book_importer = BookImporter.new("#{Rails.root}/db/books_sample.csv")

book_importer.entries.each do |book|
  puts "Book #{book.inspect} imported!" if book.save
end

# Import Ratings...
