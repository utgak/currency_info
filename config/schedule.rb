set :chronic_options, hours24: true

every 1.days, at: '12:00' do
  runner 'CurrencyHistory.save_todays_data'
end
