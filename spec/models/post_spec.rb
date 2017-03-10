require "rails_helper"

describe Post do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }
end
