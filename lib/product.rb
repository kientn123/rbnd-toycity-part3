class Product

  attr_reader :title, :stock, :price

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @stock = options[:stock]
    @price = options[:price]
    add_to_products
  end

  def self.all
    @@products
  end

  def add_to_products
    @@products.each do |product|
      if product.title == @title
        raise DuplicateProductError.new("#{@title} already exists.")
      end
    end
    @@products << self
  end

  def self.find_by_title(title)
    @@products.each do |product|
      return product if product.title == title
    end
    nil
  end

  def in_stock?
    @stock && @stock > 0
  end

  def self.in_stock
    @@products.select {|product| product.in_stock?}
  end

end
