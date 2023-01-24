require_relative '../item_types'
require_relative '../item'

describe Item do

  context 'when creating non imported and tax free item' do
    subject(:item) { described_class.new('Book', ItemTypes::BOOK, 12.49, 2, false) }

    it 'return 0 when calculating the sale tax' do
      expect(item.sale_tax).to(eq(0))
    end

    it 'return proper value when calculating total price' do
      expect(item.total_price).to(eq(24.98))
    end

    it 'return proper value when calculating total price with tax' do
      expect(item.total_price_with_tax).to(eq(24.98))
    end
  end

  context 'when creating non imported and non tax free item' do
    subject(:item) { described_class.new('Bottle of Perfume', ItemTypes::GENERIC, 18.99, 1, false) }

    it 'return 10% of total cost when calculating the sale tax' do
      expect(item.sale_tax).to(eq(1.9))
    end

    it 'return proper value when calculating total price' do
      expect(item.total_price).to(eq(18.99))
    end

    it 'return proper value when calculating total price with tax' do
      expect(item.total_price_with_tax).to(eq(20.89))
    end
  end

  context 'when creating imported and tax free item' do
    subject(:item) { described_class.new('box of chocolates', ItemTypes::FOOD, 11.25, 3, true) }

    it 'return 5% of total cost when calculating the sale tax' do
      expect(item.sale_tax).to(eq(1.80))
    end

    it 'return proper value when calculating total price' do
      expect(item.total_price).to(eq(33.75))
    end

    it 'return proper value when calculating total price with tax' do
      expect(item.total_price_with_tax).to(eq(35.55))
    end
  end

  context 'when creating imported and non tax free item' do
    subject(:item) { described_class.new('Bottle of Perfume', ItemTypes::GENERIC, 27.99, 1, true) }

    it 'return 15% of total cost when calculating the sale tax' do
      expect(item.sale_tax).to(eq(4.2))
    end

    it 'return proper value when calculating total price' do
      expect(item.total_price).to(eq(27.99))
    end

    it 'return proper value when calculating total price with tax' do
      expect(item.total_price_with_tax).to(eq(32.19))
    end
  end
end
