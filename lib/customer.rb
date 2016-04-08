class Customer

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @@customers << self
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
      return customer if customer.name == name
    end
  end

end
