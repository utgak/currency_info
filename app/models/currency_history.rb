class CurrencyHistory < ApplicationRecord
  belongs_to :currency

  def self.save_todays_data
    Currency.all.pluck(:cbr_id).each do |cbr_id|
      raw_data = CbrClient.new.daily(Date.current)
      prepared_data = CurrencyParser.new(raw_data).daily_by_id(cbr_id)

      CurrencyHistory.create!(prepared_data)
    end
  end
end
