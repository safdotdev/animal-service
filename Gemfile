source 'https://rubygems.org'

group :development, :test do
  gem 'rspec'
  gem 'pry'

  gem 'combustion'
  if ENV['X_PACT_DEVELOPMENT']
    gem 'pact', path: '../pact-ruby'
  else
    gem 'pact', git: 'https://github.com/safdotdev/pact-ruby.git', branch: 'feat/pact-ruby-v2-conditional-install'
  end
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
