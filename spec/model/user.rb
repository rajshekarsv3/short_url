require "rails_helper"

RSpec.describe User, :type => :model do
  it "unique and valid email id, presence of name and password. encrypted_password should be valid" do
    @user = User.create!(email: "raj@schoolcom.in", name: "Raj",encrypted_password: User.encrypt_password("raj"))
    expect(@user.email).to eq "raj@schoolcom.in"
    expect(@user.name).to eq "Raj"
    expect(@user.authenticate("raj")).to eq true
  end
end