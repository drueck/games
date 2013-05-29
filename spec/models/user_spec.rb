require 'spec_helper'

describe User do

  it { should have_many(:user_games) }
  it { should have_many(:games).through(:user_games) }

end
