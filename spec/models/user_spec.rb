require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :full_name }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :comments }
end
