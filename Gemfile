source "https://rubygems.org"

ruby "2.3.1"

gem "pg"
gem "rails", "5.0.2"

# assets
gem "autoprefixer-rails"
gem "coffee-rails"
gem "mini_racer"
gem "premailer-rails"
gem "sass-rails", "~> 5.0.0", ">= 5.0.6"
gem "twitter-bootstrap-rails"
gem "uglifier", ">= 2.7.2"

source "https://rails-assets.org" do
  gem "rails-assets-jquery-ujs"
  gem "rails-assets-jquery2"
end

# views
gem "active_link_to"
gem "fragments.js", git: "https://github.com/fs/fragments.js.git"
gem "inky-rb", require: "inky"
gem "metamagic"
gem "simple_form"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise"
gem "draper"
gem "factory_girl_rails"
gem "flamegraph"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "puma"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false, git: "https://github.com/MiniProfiler/rack-mini-profiler.git"
gem "refile", require: "refile/rails", git: "https://github.com/rkurmanaleev/refile.git"
gem "refile-mini_magick"
gem "refile-s3"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "stackprof"

group :staging, :production do
  gem "newrelic_rpm"
end

group :test do
  gem "capybara"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "guard-rspec"
  gem "launchy"
  gem "poltergeist"
  gem "rails-controller-testing"
  gem "rspec-its"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "terminal-notifier-guard"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails"
  gem "faker"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "letter_opener"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console", "~> 2.0"
end
