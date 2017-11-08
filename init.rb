require "json"
require_relative "library"
require_relative "book"
require_relative "author"
require_relative "order"
require_relative "reader"
require "faker"

quantity_books = 9
quantity_readers = 9
quantity_house = 54

authors = []

10.times do |index|
    authors << Author.new(Faker::Book.author , Faker::Lorem.sentences(1))
end

books = []

10.times do |index|
    books << Book.new(Faker::Book.title , authors[rand(quantity_books)])
end

readers = []

10.times do |index|
readers << Reader.new( name:Faker::Name.name ,email:Faker::Internet.email , city:Faker::Address.city ,
  street:Faker::Address.street_name , house:rand(quantity_house)) 
end

orders = []

10.times do |index|
    orders << Order.new(books[rand(quantity_books)], readers[rand(quantity_readers)]) 
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

library_second = Library.from_hash data_hash

f = File.open('library_second.json', 'w') 
f.write( library_second.to_hash.to_json )
f.close

puts books.map{|book| book.read}
puts '################'
puts library.most_popular_book

puts readers.map{|reader| reader.read}
puts '################'
puts library.best_reader

puts library.count_readers_for_bestsellers


