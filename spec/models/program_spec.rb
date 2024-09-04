require 'rails_helper'

RSpec.describe Program, type: :model do
  it "has a valid factory" do
    expect(create(:program)).to  be_valid
  end

  it "validates that code cannot be nil" do
    program = build(:program, code: nil)
    expect(program).not_to  be_valid
  end
  it "validates that name cannot be nil" do
    program = build(:program, name: nil)
    expect(program).not_to  be_valid
  end
end
