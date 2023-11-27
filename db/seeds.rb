# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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