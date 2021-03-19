require 'rails_helper'

describe PostReaction do
  describe 'validations' do
    it { should validate_presence_of(:kind_of_reaction) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
