require 'pry'
require 'faker'
require 'yaml'

namespace :bootstrap do
  task :generate_fake_data do
    books = {}
    id = 0
    until books.length == 10 do
      title = Faker::Book.title
      id += 1
      books[id] = {title: title, timestamp: nil}
    end
    File.open("data/fake_data.yml","w") do |file|
      file.write books.to_yaml
    end 
  end
end
