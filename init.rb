require './item_types'
require './item'
require './shopping_cart'

def print_shopping_cart(shopping_cart)
  puts '<<<<<<<<<'
  shopping_cart.items.each do |item|
    imported_str = item.imported ? ' imported' : ''
    puts "#{item.quantity}#{imported_str} #{item.name} at #{'%.2f' % item.total_price_with_tax}"
  end
  puts ''
  puts "Sales Taxes: #{'%.2f' % shopping_cart.calculate_sales_taxes}"
  puts "Total: #{'%.2f' % shopping_cart.calculate_total}"
  puts '>>>>>>>>>'
  puts ''
  puts ''
  puts ''
end


shopping_cart1 = ShoppingCart.new
shopping_cart1.add_item(Item.new('books', ItemTypes::BOOK, 12.49, 2, false))
shopping_cart1.add_item(Item.new('music CD', ItemTypes::GENERIC,14.99, 1, false))
shopping_cart1.add_item(Item.new('chocolate bar', ItemTypes::FOOD,0.85, 1, false))
print_shopping_cart(shopping_cart1)

shopping_cart2 = ShoppingCart.new
shopping_cart2.add_item(Item.new('box of chocolates', ItemTypes::FOOD, 10, 1, true))
shopping_cart2.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 47.50, 1, true))
print_shopping_cart(shopping_cart2)

shopping_cart3 = ShoppingCart.new
shopping_cart3.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 27.99, 1, true))
shopping_cart3.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 18.99, 1, false))
shopping_cart3.add_item(Item.new('packet of headache pills', ItemTypes::MEDICAL, 9.75, 1, false))
shopping_cart3.add_item(Item.new('boxes of chocolates', ItemTypes::FOOD, 11.25, 3, true))
print_shopping_cart(shopping_cart3)
