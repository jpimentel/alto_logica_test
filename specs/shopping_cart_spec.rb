require_relative '../item_types'
require_relative '../item'
require_relative '../shopping_cart'

describe ShoppingCart do

  context 'when trying to add items' do

    subject(:shopping_cart) { described_class.new }

    before do
      shopping_cart.add_item(Item.new('books', ItemTypes::BOOK, 12.49, 2, false))
      shopping_cart.add_item(Item.new('music CD', ItemTypes::GENERIC,14.99, 1, false))
      shopping_cart.add_item(Item.new('chocolate bar', ItemTypes::FOOD,0.85, 1, false))
    end

    it 'should add items' do
      count = shopping_cart.items.count

      shopping_cart.add_item({'mock_item': '1'})
      expect(shopping_cart.items.count).to(eq(count + 1))
    end
  end

  context 'when creating a shopping cart without imported items' do

    subject(:shopping_cart) { described_class.new }

    before do
      shopping_cart.add_item(Item.new('books', ItemTypes::BOOK, 12.49, 2, false))
      shopping_cart.add_item(Item.new('music CD', ItemTypes::GENERIC,14.99, 1, false))
      shopping_cart.add_item(Item.new('chocolate bar', ItemTypes::FOOD,0.85, 1, false))
    end

    it 'should return proper sales taxes' do
      expect(shopping_cart.calculate_sales_taxes).to(eq(1.50))
    end

    it 'should return proper total' do
      expect(shopping_cart.calculate_total).to(eq(42.32))
    end
  end

  context 'when creating a shopping cart with imported items' do

    subject(:shopping_cart) { described_class.new }

    before do
      shopping_cart.add_item(Item.new('box of chocolates', ItemTypes::FOOD, 10, 1, true))
      shopping_cart.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 47.50, 1, true))
    end

    it 'should return proper sales taxes' do
      expect(shopping_cart.calculate_sales_taxes).to(eq(7.65))
    end

    it 'should return proper total' do
      expect(shopping_cart.calculate_total).to(eq(65.15))
    end
  end

  context 'when creating a shopping cart with imported items and non-imported items' do

    subject(:shopping_cart) { described_class.new }

    before do
      shopping_cart.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 27.99, 1, true))
      shopping_cart.add_item(Item.new('bottle of perfume', ItemTypes::GENERIC, 18.99, 1, false))
      shopping_cart.add_item(Item.new('packet of headache pills', ItemTypes::MEDICAL, 9.75, 1, false))
      shopping_cart.add_item(Item.new('boxes of chocolates', ItemTypes::FOOD, 11.25, 3, true))
    end

    it 'should return proper sales taxes' do
      expect(shopping_cart.calculate_sales_taxes).to(eq(7.90))
    end

    it 'should return proper total' do
      expect(shopping_cart.calculate_total).to(eq(98.38))
    end
  end
end
