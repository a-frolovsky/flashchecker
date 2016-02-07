# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Card.create([
  {
    original_text: 'Hello',
    translated_text: 'Привет',
    review_date: '2016-02-07'
  },
  {
    original_text: 'Good',
    translated_text: 'Хорошо',
    review_date: '2016-02-07'
  },
  {
    original_text: 'Win',
    translated_text: 'Победа',
    review_date: '2016-02-07'
  }
])
