require './tax_helper'

class Item
  attr_reader :name, :price, :type, :quantity, :imported

  def initialize(name, type, price, quantity, imported)
    @name = name
    @price = price
    @type = type
    @quantity = quantity
    @imported = imported
  end

  def total_price
    price * quantity
  end

  def sale_tax
    tax_percent = TaxHelper.get_for_type(@type)
    tax = TaxHelper.round_nearest_005(price * tax_percent) * quantity

    if imported
      tax += TaxHelper.round_nearest_005(price * 0.05) * quantity
    end
    tax
  end

  def total_price_with_tax
    total_price + sale_tax
  end
end
