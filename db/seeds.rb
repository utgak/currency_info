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
  CurrencyHistory.create!(CurrencyParser.new(CbrClient.new.dynamic(1.month.ago, Date.current, cbr_id)).dynamic)
end
