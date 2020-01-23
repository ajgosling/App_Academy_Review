require 'rails_helper'

RSpec.describe Wand, type: :model do
  it "knows its owner" do
    expect(Wand.first.owner.fname).to eq("Harry")
  end
end
