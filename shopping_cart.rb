class ShoppingCart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def calculate_sales_taxes
    total_taxes = 0
    @items.each do |item|
      total_taxes += item.sale_tax
    end

    total_taxes.round(2)
  end

  def calculate_total
    total = 0
    @items.each do |item|
      total += item.total_price_with_tax
    end

    total
  end
end
