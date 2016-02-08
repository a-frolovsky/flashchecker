require 'open-uri'
require 'nokogiri'

url = "http://sloovo.com/ru/biblioteka.php?type=obuchenie&language=EN&category=statja&url=samye-populyarnye-angliyskie-slova"
document = Nokogiri::HTML(open(url))
words = document.xpath('//*[@id="content"]/div/div[3]/div[2]/table[1]/tbody/*/td')

words.each do |w|
  # original - transpated
  item = w.text.split('-')

  puts "#{w.text} loaded"

  Card.create({
    original_text: item[0].to_s.strip.capitalize,
    translated_text: item[1].to_s.mb_chars.strip.capitalize,
    review_date: Time.now + 3.days
  })
end

puts 'Complete.'
