require "refile/fog"
require "refile/simple_form"

credentials = {
  provider: "Google",
  google_storage_access_key_id: ENV.fetch("GOOGLE_KEY_ID"),
  google_storage_secret_access_key: ENV.fetch("GOOGLE_ACCESS_KEY"),
  directory: ENV.fetch("GOOGLE_DIRECTORY")
}

Refile.configure do |config|
  config.cache = Refile::Fog::Backend.new(prefix: "cache", **credentials)
  config.store = Refile::Fog::Backend.new(prefix: "store", **credentials)
end
