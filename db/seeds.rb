user = User.create({ email: 'test@mailinator.com', password: 'qwerty', password_confirmation: 'qwerty' })
puts 'User: test@test.ru, qwerty created.'

deck = Deck.create({ title: 'First deck', user: user })
puts 'First deck created.'

Card.create({ original_text: 'Hello', translated_text: 'Привет', review_date: Time.zone.now, user: user, deck: deck })
puts 'Card created.'
