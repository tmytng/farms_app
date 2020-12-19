# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    # subject〜を書くことでis_expected〜を使えるようになる
    subject { test_user.valid? }
    # letが呼び出された時点で実行される
    let(:user) { create(:user) }
    let(:user2) { create(:user) }

    context 'name' do
      let(:test_user) { user }
      let(:test_user2) { user2 }

      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_user.name = ''
        test_user.valid?
        expect(test_user.errors[:name]).to include('を入力してください')
      end
      it '一意であること' do
        # 登録できたらNG
        test_user.name = 'テスト太郎'
        test_user.save
        test_user2.name = 'テスト太郎'
        test_user2.save
        test_user2.valid?
        expect(test_user2).to be_invalid
      end
      it '一意でない場合はエラーが出る' do
        test_user.name = 'テスト太郎'
        test_user.save
        test_user2.name = 'テスト太郎'
        test_user2.save
        test_user2.valid?
        expect(test_user2.errors[:name]).to include('はすでに存在します')
      end
    end

    context 'email' do
      let(:test_user) { user }
      let(:test_user2) { user2 }

      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_user.email = ''
        test_user.valid?
        expect(test_user.errors[:email]).to include('を入力してください')
      end
      it '一意であること' do
        # 登録できたらNG
        test_user.email = 'test1@test.co.jp'
        test_user.save
        test_user2.email = 'test1@test.co.jp'
        test_user2.save
        test_user2.valid?
        expect(test_user2).to be_invalid
      end
      it '一意でない場合はエラーが出る' do
        test_user.email = 'test1@test.co.jp'
        test_user.save
        test_user2.email = 'test1@test.co.jp'
        test_user2.save
        test_user2.valid?
        expect(test_user2.errors[:email]).to include('はすでに存在します')
      end
    end

    context 'password' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.password = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_user.password = ''
        test_user.valid?
        expect(test_user.errors[:password]).to include('を入力してください')
      end
      it '8文字以上であること' do
        test_user.password = '00000000'
        is_expected.to eq true
      end
      it '8文字未満はNG' do
        test_user.password = Faker::Lorem.characters(number: 7)
        is_expected.to eq false
      end
      it '8文字未満の場合はエラーが出る' do
        test_user.password = Faker::Lorem.characters(number: 7)
        test_user.valid?
        expect(test_user.errors[:password]).to include('は8文字以上で入力してください')
      end
      it 'パスワードが不一致' do
        test_user.password = 'password1'
        test_user.password_confirmation = 'password2'
        test_user.valid?
        expect(test_user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
