require_relative "book"


class Library

	attr_accessor :books, :orders , :readers , :authors

	def initialize(options ={})
		@books = options[:books]
		@orders = options[:orders]
		@readers = options[:readers]
		@authors = options[:authors]	
	end

	def add_books books
		@books += books
	end

	def add_authors authors
		@authors += authors
	end

	def add_readers readers
		@readers += readers
	end

	def add_orders orders
		@orders += orders
	end

	def to_hash
        { library: 
        	{ 
        		books: @books.map {|book| book.to_hash},
        		readers: @readers.map {|reader| reader.to_hash},
        		orders: @orders.map {|order| order.to_hash}

        	}
        }
    end

    def self.from_hash data
    	books = []
    	data['library']['books'].each do |book|
    		books << Book.from_hash(book)
    	end
    	readers = []
    	data['library']['readers'].each do |reader|
    		readers << Reader.from_hash(reader)
    	end
    	orders = []
    	data['library']['orders'].each do |order|
    		orders << Order.from_hash(order)
    	end

        self.new(books: books, readers: readers, orders: orders)

    end	


end