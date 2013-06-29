require 'spec_helper'

describe Game do
  it { should validate_presence_of(:title) }
	it { should have_many(:user_games).dependent(:destroy) }
	it { should have_many(:users).through(:user_games) }
end
