require 'rails_helper'

describe User do
  describe '#create' do

    it "name, email, password, password_confirmationの入力は必須" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameなしでの登録はNG" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailなしでの登録はNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailなしでの登録はNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordなしでの登録はNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmなしでの登録はNG" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "nameは2文字以下NG" do
      user = build(:user, name: "aa")
      user.valid?
      expect(user.errors[:name]).to include("は3文字以上で入力してください")
    end

    it "nameは15文字以上NG" do
      user = build(:user, name: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は15文字以内で入力してください")
    end

    it "emailの重複登録はNG" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "nameの重複登録はNG" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("はすでに存在します")
    end

    it "passwordは8文字以上" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      expect(user).to be_valid
    end

    it "passwordが7文字以下はNG" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

  end
end
