Currency.create!([{
  name: 'Китайский юань',
  char_code: 'CNY',
  cbr_id: 'R01375'
},
{
  name: 'Евро',
  char_code: 'EUR',
  cbr_id: 'R01239'
},
{
  name: 'Доллар США',
  char_code: 'USD',
  cbr_id: 'R01235'
}])

Currency.all.pluck(:cbr_id).each do |cbr_id|
  raw_data = CbrClient.new.dynamic(2.month.ago.to_date, Date.current, cbr_id)
  prepared_data = CurrencyParser.new(raw_data).dynamic

  CurrencyHistory.create!(prepared_data)
end
