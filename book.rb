class Book

    attr_accessor :title, :author, :read
    
    def initialize(title, author)
        @title = title
        @author = author
        @read = 0
    end

    def to_hash
        {'title' => @title, 'author' => @author.to_hash}
    end

    def self.from_hash data
        self.new(data['title'], Author.from_hash(data['author']))
    end 

    def readed
        @read += 1
    end
end


