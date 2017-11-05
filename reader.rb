class Reader

	def initialize(options ={})
		@name = options[:name]
		@email = options[:email]
		@city = options[:city]
		@street = options[:street]
		@house = options[:house]
	end

	def to_hash
        {'name' => @name, 'email' => @email, 'city' => @city, 'street' => @street , 'house' => @house }
    end

    def self.from_hash data
        self.new(name: data['name'], email: data['email'], city: data['city'], street: data['street'], house: data['house'])
    end	

end