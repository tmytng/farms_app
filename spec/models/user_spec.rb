# frozen_string_literal: true

require 'rails_helper'

# subject〜を書くことでis_expected〜を使えるようになる
# letが呼び出された時点で実行される

RSpec.describe User, type: :model do
  describe 'ActiveStrageテスト' do
    before do
      @user = build(:user)
      @user.avatar = fixture_file_upload('/files/test_user.png')
    end
    it 'アバター画像の登録ができる' do
      expect(@user).to be_valid
    end
  end

  describe 'バリデーションテスト' do
    subject { test_user.valid? }
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
      it '15文字以内であること' do
        test_user.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
      it '15文字以上の場合はエラーが出る' do
        test_user.name = Faker::Lorem.characters(number: 16)
        test_user.valid?
        expect(test_user.errors[:name]).to include('は15文字以内で入力してください')
      end
      it '3文字未満はNG' do
        test_user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq false
      end
      it '3文字未満の場合はエラーが出る' do
        test_user.name = Faker::Lorem.characters(number: 2)
        test_user.valid?
        expect(test_user.errors[:name]).to include('は3文字以上で入力してください')
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

  describe 'アソシエーションテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context 'Postモデルとのアソシエーション' do
      let(:target) { :posts }
      # 1:Nのアソシエーション
      it '1:Nの関係' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Post'
      end
    end
    context 'Auditモデルとのアソシエーション' do
      let(:target) { :audits }
      # 1:Nのアソシエーション
      it '1:Nの関係' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Audit'
      end
    end
    context 'Messageモデルとのアソシエーション' do
      let(:target) { :messages }
      # 1:Nのアソシエーション
      it '1:Nの関係' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Message'
      end
    end
    context 'ProjectUserモデルとのアソシエーション' do
      let(:target) { :project_users }
      it '1:Nの関係（中間テーブル）' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'ProjectUser'
      end
    end
    context 'Projectモデルとのアソシエーション' do
      let(:target) { :projects }
      it 'N:Nの関係（中間テーブルが介在）' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Project'
      end
    end
  end
  describe 'データベース接続テスト' do
    subject { described_class.connection_config[:database] }

    it '指定のDBに接続していること' do
      is_expected.to match(/farms_app_test/)
    end
    it '本番DBに接続していないこと' do
      is_expected.not_to match(/farms_app_production/)
    end
  end
end
