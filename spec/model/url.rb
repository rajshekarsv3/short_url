require "rails_helper"

RSpec.describe Url, :type => :model do
  it "Validate presence and format of originial url" do
    @url = Url.create!(original_url: "http://sdas.co", shorty: "Raj",user_id: 1)
    puts @url.errors.keys
    expect(@url.errors.count).to eq 0
  end
end