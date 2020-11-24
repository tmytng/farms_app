require 'rails_helper'

describe User do
  describe '#create' do

    it "nameなしでの登録はNG" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailなしでの登録はNG" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

  end
end
