class Transaction

  attr_reader :customer, :product, :id
  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    add_to_transactions
  end

  def add_to_transactions
    if !@product.in_stock?
      raise OutOfStockError.new("#{@product.title} is out of stock.")
    end
    @@transactions << self
    @id = @@transactions.length
    @product.stock -= 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions[id-1]
  end

  def self.find_by_product(product)
    @@transactions.select {|transaction| transaction.product == product}
  end

  def self.find_by_customer(customer)
    @@transactions.select {|transaction| transaction.customer == customer}
  end

end
