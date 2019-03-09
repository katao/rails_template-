dir = Dir::pwd

########################################
# Gemfile
########################################
remove_file 'Gemfile'
create_file 'Gemfile' do body = '' end

add_source 'https://rubygems.org'

gem 'rails'
gem 'rack-contrib'
gem 'sdoc', group: :doc
gem 'therubyracer'

gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'sass-rails'
gem 'bcrypt'

gem 'dotenv-rails'
gem 'config'
gem 'enum_help'

gem 'mysql2'
gem 'redis-rails'
gem 'seed-fu'

gem 'carrierwave'
gem 'carrierwave-data-uri'
gem 'fog', require: 'fog/aws'
gem 'mini_magick'
gem 'kaminari'
gem 'ransack'

gem 'gretel'
gem 'bootstrap_form'
gem 'paranoia'
gem 'active_hash'
gem 'virtus'

gem 'unicorn'
gem 'unicorn-rails'
gem 'unicorn-worker-killer'

gem 'google-analytics-rails'
gem 'meta-tags'

gem 'web-console', group: :development

gem 'adminlte2-rails'

gem_group :staging do
  gem 'letter_opener_web'
end

gem_group :development, :test do
  gem 'letter_opener'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rubocop'
  gem 'bullet'

  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
  gem 'byebug'
  gem 'better_errors'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  gem 'quiet_assets'
  gem 'awesome_print'

  gem 'annotate'
  gem 'migration_comments'

  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'

  gem 'rails-admin-scaffold'
end

gem_group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'fuubar'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
end

########################################
# Bundle install
########################################
run "bundle install"
run "bundle update"
run "bundle install"

########################################
# Generators
########################################
generate 'rspec:install'
generate 'rails_config:install'

########################################
# Files and Directories
########################################
remove_dir 'test'
remove_file 'README.rdoc'
remove_file "public/index.html"

application <<-APPEND_APPLICATION
config.active_record.default_timezone = :local
config.time_zone = 'Tokyo'
config.i18n.default_locale = :ja
config.active_record.raise_in_transactional_callbacks = true
config.generators do |generator|
  generator.assets false
  generator.helper false
  generator.decorator false
  generator.template_engine = :erb
end
APPEND_APPLICATION

remove_file '.gitignore'
create_file '.gitignore' do
  body = <<EOS
*.rbc
capybara-*.html
.rspec
/log/*
!/log/.keep
/tmp
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
**.orig
rerun.txt
pickle-email-*.html

config/initializers/secret_token.rb
config/database.yml
.env
/.bundle
/vendor/bundle
.rvmrc
/vendor/assets/bower_components
*.bowerrc
bower.json
.powenv
.DS_Store
.AppleDouble
.LSOverride
Icon
._*
[._]*.s[a-w][a-z]
[._]s[a-w][a-z]
*.un~
Session.vim
.netrwhist
*~
.idea/
.project
node_modules/
*.rdb
.vagrant/
EOS
end

########################################
# Git
########################################
git :init
git :add => '.'
git :commit => '-am "Initial commit"'
