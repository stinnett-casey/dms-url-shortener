require 'rails_helper'

RSpec.describe Link, type: :model do
  it "should not have a blank token" do
    @link = Link.new
    @link.save
    expect(@link.token).not_to be_empty 
  end
end
