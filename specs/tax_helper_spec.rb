require_relative '../tax_helper'

describe TaxHelper do

  context 'when getting tax percent per item type' do
    it 'return 0 when item type is food' do
      expect(TaxHelper.get_percent_for_type(ItemTypes::FOOD)).to(eq(0))
    end

    it 'return 0 when item type is book' do
      expect(TaxHelper.get_percent_for_type(ItemTypes::BOOK)).to(eq(0))
    end

    it 'return 0 when item type is medical' do
      expect(TaxHelper.get_percent_for_type(ItemTypes::MEDICAL)).to(eq(0))
    end

    it 'return 0.10 when item type is generic' do
      expect(TaxHelper.get_percent_for_type(ItemTypes::GENERIC)).to(eq(0.10))
    end
  end

  context 'when rounding to nearest 0.05' do
    it 'round properly different values' do
      expect(TaxHelper.round_nearest_005(0)).to(eq(0))
      expect(TaxHelper.round_nearest_005(2.799)).to(eq(2.80))
      expect(TaxHelper.round_nearest_005(1.3995)).to(eq(1.4))
      expect(TaxHelper.round_nearest_005(0.5625)).to(eq(0.6))
      expect(TaxHelper.round_nearest_005(0.01)).to(eq(0.05))
      expect(TaxHelper.round_nearest_005(0.11)).to(eq(0.15))
    end
  end
end
