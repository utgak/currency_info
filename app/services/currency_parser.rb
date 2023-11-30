class CurrencyParser
  def initialize(text)
    @xml = Nokogiri::XML(text)
  end

  def daily_by_id(currency_id)
    {
      rate: @xml.xpath("/ValCurs/Valute[@ID='#{currency_id}']/VunitRate").first.content.gsub(',','.').to_d,
      date: Date.current,
      currency: Currency.where(cbr_id: currency_id).first
    }
  end

  def dynamic
    @xml.xpath("/ValCurs/Record").map do |element|
      {
        rate: @xml.xpath("#{element.path}/VunitRate").first.content.gsub(',','.').to_d,
        date: element.attribute('Date').content.to_date,
        currency: Currency.where(cbr_id: element.attribute('Id').content).first
      }
    end
  end
end
