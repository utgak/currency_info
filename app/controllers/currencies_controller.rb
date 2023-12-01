class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.all.map do |cur|
      {cur => CurrencyHistory.where(date: 1.month.ago..Date.today, currency: cur)}
    end
  end

  def history
    @currencies = Currency.all.map do |cur|
      {
        cur.char_code => {
          last_week_1: [
            CurrencyHistory.where(date: (Date.today.beginning_of_week.weeks_ago(1) + 1).., currency: cur).limit(1),
            CurrencyHistory.where(date: (Date.today.end_of_week.weeks_ago(1) - 1).., currency: cur).limit(1)
          ],
          last_week_2: [
            CurrencyHistory.where(date: (Date.today.beginning_of_week.weeks_ago(2) + 1).., currency: cur).limit(1),
            CurrencyHistory.where(date: (Date.today.end_of_week.weeks_ago(2) - 1).., currency: cur).limit(1)
          ],
          last_week_3: [
            CurrencyHistory.where(date: (Date.today.beginning_of_week.weeks_ago(3) + 1).., currency: cur).limit(1),
            CurrencyHistory.where(date: (Date.today.end_of_week.weeks_ago(3) - 1).., currency: cur).limit(1)
          ],
          last_week_4: [
            CurrencyHistory.where(date: (Date.today.beginning_of_week.weeks_ago(4) + 1).., currency: cur).limit(1),
            CurrencyHistory.where(date: (Date.today.end_of_week.weeks_ago(4) - 1).., currency: cur).limit(1)
          ]
        }
      }
    end

    calculate_change
  end

  private

  def calculate_change
    @currencies.map do |cur|
      cur.values.map do |weeks|
        weeks.each do |key, value|
          if value[1] && value[0]
            persent = (((value[1].first.rate - value[0].first.rate) / value[1].first&.rate) * 100).round(2)
            persent_str = persent.positive? ? '+' + persent.to_s : persent.to_s
            last_value = value[1].first.rate.round(2)

            weeks[key] = [persent_str, last_value]
          end
        end
      end
    end
  end
end
