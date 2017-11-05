class Order

	attr_accessor :book

	def initialize(options ={})
		@book = options[:book]
		@reader = options[:reader]
	end

	
	def to_hash
        {'book' => @book.to_hash, 'reader' => @reader.to_hash}
    end

    def self.from_hash data
        self.new(book: Book.from_hash( data['book']), reader: Reader.from_hash(data['reader']))
    end	

	
end