require 'rake/testtask'
require 'pry'
require 'faker'
require 'yaml'

namespace :bootstrap do
  task :generate_fake_data do
    books = {}
    id = 0
    until books.length == 10
      title = Faker::Book.title
      id += 1
      books[id] = { title: title, timestamp: nil }
    end
    File.open('data/data.yml', 'w') do |file|
      file.write books.to_yaml
    end
  end
end

desc 'Start API Application'
task :start do
  `ruby library_api.rb`
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

task default: :test
