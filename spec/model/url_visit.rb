require "rails_helper"

RSpec.describe UrlVisit, :type => :model do
  it "Visit count of the url should be incremented after saving visit" do
    @url = Url.create!(original_url: "http://sdas.co", shorty: "Raj",user_id: 1)
    count = @url.visits_count
    @url_visit = UrlVisit.create!(url_id: @url.id)
    expect(@url_visit.url.visits_count).to eq count+1
  end
end