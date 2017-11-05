class Author

	attr_accessor :name , :biography

	def initialize(options ={})
		@name = options[:name]
		@biography = options[:biography]	
	end

	def to_hash
        {'name' => @name, 'biography' => @biography}
    end

    def self.from_hash data
        self.new(name: data['name'], biography: data['biography'])
    end	

end