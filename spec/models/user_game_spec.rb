require 'spec_helper'

describe UserGame do
	it { should belong_to(:user) }
	it { should belong_to(:game) }
end
