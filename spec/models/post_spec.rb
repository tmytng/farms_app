require 'rails_helper'

describe Post do
  describe '#create' do

    it "必要項目の入力は必須" do
      post = create(:post)
      expect(post).to be_valid
    end

  end
end
