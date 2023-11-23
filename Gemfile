source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '6.1.7.2'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bootsnap', require: false
gem 'listen'
gem 'dotenv-rails'
gem 'mysql2'

# ログイン機能
gem 'devise'

# 日本語化
gem 'rails-i18n'
gem 'devise-i18n'

# Bootstrap
gem 'bootstrap'
gem 'jquery-rails'
gem 'devise-bootstrap-views'

# ページネーション
gem 'will_paginate'
gem 'bootstrap-will_paginate'

#サンプル追加
gem 'faker'

# csvインポート
gem 'roo'

# グラフ
gem 'chartkick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
  gem 'rubocop', require: false
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
