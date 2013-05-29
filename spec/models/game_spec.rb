require 'spec_helper'

describe Game do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:bgg_id) }
  it "should validate the uniqueness of bgg_id" do
    FactoryGirl.create(:game)
    should validate_uniqueness_of(:bgg_id)
  end

end
