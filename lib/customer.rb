class Customer

  attr_reader :name
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def add_to_customers
    @@customers.each do |customer|
      return DuplicateCustomerError.new("#{@name} already exists") if customer.name == @name
    end
    @@customers << self
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
      return customer if customer.name == name
    end
  end

  def self.all
    @@customers
  end

  def purchase(product)
    Transaction.new(self, product)
  end

end
