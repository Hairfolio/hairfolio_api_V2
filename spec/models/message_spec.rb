require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:message) { build(:message) }

  it 'should be valid' do
    expect(message).to be_valid
  end

  describe 'should require' do
    it 'a body' do
      message.body = nil
      expect(message).to_not be_valid
    end
  end
end
