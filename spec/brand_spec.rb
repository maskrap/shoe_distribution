require "spec_helper"

describe Brand, type: :model do
  it { should have_and_belong_to_many :stores }
  it "validates presence of name" do
    test_brand = Brand.create({name: ""})
    expect(test_brand.save).to eq(false)
  end

  it "converts the name to title case" do
    brand = Brand.create({name: "nike"})
    expect(brand.name).to eq("Nike")
  end
end
