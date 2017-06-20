require "refile/s3"
require "refile/simple_form"

aws = {
  access_key_id: ENV.fetch("AWS_ACCESS_KEY"),
  secret_access_key: ENV.fetch("AWS_SECRET_KEY"),
  region: ENV.fetch("AWS_REGION"),
  bucket: ENV.fetch("AWS_BUCKET")
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
