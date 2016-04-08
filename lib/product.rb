class Product

  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
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

end
