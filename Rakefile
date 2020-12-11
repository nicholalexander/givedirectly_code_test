require 'pry'
require 'faker'
require 'yaml'

namespace :bootstrap do
  task :generate_fake_data do
    books = {}
    until books.length == 10 do
      title = Faker::Book.title
      id = Digest::SHA2.hexdigest(title).hex
      books[id] = {title: title, timestamp: nil}
    end
    File.open("data/fake_data.yml","w") do |file|
      file.write books.to_yaml
    end 
  end
end
