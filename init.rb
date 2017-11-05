require 'json'
require_relative "library"
require_relative "book"
require_relative "author"
require_relative "order"
require_relative "reader"
require "faker"


authors = []

	10.times do |index|
		authors << Author.new(name: Faker::Book.author , biography:Faker::Lorem.sentences(1))
	end


books = []

	10.times do |index|
		books << Book.new(title: Faker::Book.title , author: authors[rand(9)])
	end

f = File.open('books.json', 'w') 
f.write( books.map {|book| book.to_hash}.to_json )
f.close

file = File.read('books.json')
data_hash = JSON.parse(file)
puts data_hash

books_2 = []
data_hash.each do |data|
books_2 << Book.from_hash(data)
end


readers = []

	10.times do |index|
	readers << Reader.new(name: Faker::Name.name , email:Faker::Internet.email , city:Faker::Address.city ,
	  street:Faker::Address.street_name , house:rand(54)) 
	end


orders = []

10.times do |index|
	orders << Order.new(book: books[rand(9)], reader: readers[rand(9)]) 
end

library = Library.new books:[],readers:[], orders:[]
library.add_books books
library.add_readers readers
library.add_orders orders


f = File.open('library.json', 'w') 
f.write( library.to_hash.to_json )
f.close

file = File.read('library.json')
data_hash = JSON.parse(file)
puts data_hash

library_2 = Library.from_hash data_hash

f = File.open('library2.json', 'w') 
f.write( library_2.to_hash.to_json )
f.close

