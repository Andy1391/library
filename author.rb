class Author

    attr_accessor :name, :biography

    def initialize(name, biography)
        @name = name
        @biography = biography
    end

    def to_hash
        {'name' => @name, 'biography' => @biography}
    end

    def self.from_hash data
        self.new(data['name'], data['biography'])
    end 
end