class Product

  @@products = []

  def initialization(options={})
    @@products << self
  end

  def self.all
    @@products
  end

end
