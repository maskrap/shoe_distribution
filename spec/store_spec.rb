require "spec_helper"

describe Store, type: :model do
  it { should have_and_belong_to_many :brands }
  it "validates presence of name" do
    test_store = Store.create({name: ""})
    expect(test_store.save).to eq(false)
  end

  it "converts the name to title case" do
    store = Store.create({name: "footlocker"})
    expect(store.name).to eq("Footlocker")
  end
end
