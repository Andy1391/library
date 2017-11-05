class Book


	def initialize(options ={})
		@title = options[:title]
		@author = options[:author]	
	end

	attr_accessor :title, :author

	
	def to_hash
        {'title' => @title, 'author' => @author.to_hash}
    end

    def self.from_hash data
        self.new(title: data['title'], author: Author.from_hash(data['author']))
    end	

end


