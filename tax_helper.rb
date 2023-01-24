class TaxHelper
  TYPES = {
    ItemTypes::FOOD => 0,
    ItemTypes::BOOK => 0,
    ItemTypes::MEDICAL => 0,
    ItemTypes::GENERIC => 0.10
  }.freeze

  def self.get_percent_for_type(type)
    throw StandardError('Invalid Item type') unless TYPES.include?(type)
    TYPES[type]
  end

  def self.round_nearest_005(value)

    delta = value % 0.05
    if delta > 0
      value = value - delta + 0.05
    end
    value.round(2)
  end
end
