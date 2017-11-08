class Order

    attr_accessor :book, :reader    

    def initialize(book, reader)
        @book = book
        @reader = reader
        @book.readed
        @reader.readed      
    end

    def to_hash
        {'book' => @book.to_hash, 'reader' => @reader.to_hash}
    end

    def self.from_hash data
        self.new(Book.from_hash( data['book']), Reader.from_hash(data['reader']))
    end     
end