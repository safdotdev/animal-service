source 'https://rubygems.org'

group :development, :test do
  gem 'rspec'
  gem 'pact'
  gem 'pry'

  gem 'combustion'
  gem 'sbmt-pact', git: 'https://github.com/YOU54F/sbmt-pact.git', branch: 'feat/pact-ruby'
  gem 'webmock'
  gem "rspec-mocks"
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
end

gem 'rake'
gem 'rack'
gem 'json'
if Gem.win_platform?
  gem 'sqlite3', force_ruby_platform: true
else
  gem 'sqlite3'
end
gem 'sequel'
gem 'sinatra'
