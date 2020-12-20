# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションテスト' do
    subject { test_post.valid? }

    let(:test_post) { create(:post) }
    let(:test_post2) { create(:post) }

    context 'company_name' do
      it '空欄でないこと' do
        test_post.company_name = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_post.company_name = ''
        test_post.valid?
        expect(test_post.errors[:company_name]).to include('を入力してください')
      end
      it '30文字以内であること' do
        test_post.company_name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
      it '31文字以上の場合はエラーが出る' do
        test_post.company_name = Faker::Lorem.characters(number: 31)
        test_post.valid?
        expect(test_post.errors[:company_name]).to include('は30文字以内で入力してください')
      end
    end
    context 'prefecture_id' do
      it '初期値NG' do
        test_post.prefecture_id = '---'
        is_expected.to eq false
      end
      it '文字列はNG' do
        test_post.prefecture_id = 'hoge'
        is_expected.to eq false
      end
      it '都道府県数以上の数値はNG' do
        test_post.prefecture_id = '48'
        is_expected.to eq false
      end
      it '空欄でないこと' do
        test_post.prefecture_id = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_post.prefecture_id = ''
        test_post.valid?
        expect(test_post.errors[:prefecture_id]).to include('を入力してください')
      end
    end
    context 'company_address' do
      it '空欄OK' do
        test_post.company_address = ''
        is_expected.to eq true
      end
      it '40文字以内であること' do
        test_post.company_address = Faker::Lorem.characters(number: 41)
        is_expected.to eq false
      end
      it '31文字以上の場合はエラーが出る' do
        test_post.company_address = Faker::Lorem.characters(number: 41)
        test_post.valid?
        expect(test_post.errors[:company_address]).to include('は40文字以内で入力してください')
      end
    end
    context 'contact_person' do
      it '空欄OK' do
        test_post.contact_person = ''
        is_expected.to eq true
      end
      it '20文字以内であること' do
        test_post.contact_person = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it '21文字以上の場合はエラーが出る' do
        test_post.contact_person = Faker::Lorem.characters(number: 21)
        test_post.valid?
        expect(test_post.errors[:contact_person]).to include('は20文字以内で入力してください')
      end
    end
    context 'phone_number' do
      it '空欄OK' do
        test_post.phone_number = ''
        is_expected.to eq true
      end
      it '文字列はNG' do
        test_post.phone_number = 'hoge'
        is_expected.to eq false
      end
      it '9文字以下はNG' do
        test_post.phone_number = '123456789'
        is_expected.to eq false
      end
      it '12文字以上はNG' do
        test_post.phone_number = '123456789012'
        is_expected.to eq false
      end
      it '12文字以上の場合はエラーが出る' do
        test_post.phone_number = '123456789012'
        test_post.valid?
        expect(test_post.errors[:phone_number]).to include('は有効でありません。')
      end
      it '9文字以下の場合はエラーが出る' do
        test_post.phone_number = '123456789'
        test_post.valid?
        expect(test_post.errors[:phone_number]).to include('は有効でありません。')
      end
    end
    context 'email' do
      it '空欄OK' do
        test_post.email = ''
        is_expected.to eq true
      end
      it '50文字以内であること' do
        test_post.email = '123456789012345678901234567890123456789012@test.com'
        is_expected.to eq false
      end
      it '51文字以上の場合はエラーが出る' do
        test_post.email = '123456789012345678901234567890123456789012@test.com'
        test_post.valid?
        expect(test_post.errors[:email]).to include('は50文字以内で入力してください')
      end
      it '@が含まれていない' do
        test_post.email = 'testtest.com'
        test_post.valid?
        expect(test_post.errors[:email]).to include('は有効でありません。')
      end
    end
    context 'leadstatus_id' do
      it '初期値NG' do
        test_post.leadstatus_id = '---'
        is_expected.to eq false
      end
      it '文字列はNG' do
        test_post.leadstatus_id = 'hoge'
        is_expected.to eq false
      end
      it '規定ステータス数以上の数値はNG' do
        test_post.leadstatus_id = '11'
        is_expected.to eq false
      end
      it '空欄でないこと' do
        test_post.leadstatus_id = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_post.leadstatus_id = ''
        test_post.valid?
        expect(test_post.errors[:leadstatus_id]).to include('を入力してください')
      end
    end
    context 'product_id' do
      it '初期値NG' do
        test_post.product_id = '---'
        is_expected.to eq false
      end
      it '文字列はNG' do
        test_post.product_id = 'hoge'
        is_expected.to eq false
      end
      it '規定ステータス数以上の数値はNG' do
        test_post.product_id = '6'
        is_expected.to eq false
      end
      it '空欄でないこと' do
        test_post.product_id = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_post.product_id = ''
        test_post.valid?
        expect(test_post.errors[:product_id]).to include('を入力してください')
      end
    end
    context 'contact_reason' do
      it '空欄でないこと' do
        test_post.contact_reason = ''
        is_expected.to eq false
      end
      it '30文字以内であること' do
        test_post.contact_reason = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
      it '31文字以上の場合はエラーが出る' do
        test_post.contact_reason = Faker::Lorem.characters(number: 31)
        test_post.valid?
        expect(test_post.errors[:contact_reason]).to include('は30文字以内で入力してください')
      end
    end
    context 'contact_des' do
      it '空欄でないこと' do
        test_post.contact_des = ''
        is_expected.to eq false
      end
      it '1000文字以内であること' do
        test_post.contact_des = Faker::Lorem.characters(number: 1001)
        is_expected.to eq false
      end
      it '1001文字以上の場合はエラーが出る' do
        test_post.contact_des = Faker::Lorem.characters(number: 1001)
        test_post.valid?
        expect(test_post.errors[:contact_des]).to include('は1000文字以内で入力してください')
      end
    end
  end

  describe 'ActiveStrageテスト' do
    before do
      @post = create(:post)
      @file = fixture_file_upload('/files/test.png')
    end
    it '添付ファイルなしの登録ができる' do
      @post.post_files = nil
      expect(@post).to be_valid
    end
    it '添付ファイルの登録ができる' do
      @post.post_files = @file
      expect(@post).to be_valid
    end
    it '添付ファイル（複数）の登録ができる' do
      @post.post_files = [@file, @file]
      expect(@post).to be_valid
    end
  end

  describe 'アソシエーションテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context 'Userモデルとのアソシエーション' do
      let(:target) { :user }
      it 'N:1の関係' do
        expect(association.macro).to eq :belongs_to
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'User'
      end
    end
    context 'Projectモデルとのアソシエーション' do
      let(:target) { :project }
      it 'N:1の関係' do
        expect(association.macro).to eq :belongs_to
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Project'
      end
    end
    context 'Auditモデルとのアソシエーション' do
      let(:target) { :audits }
      # 1:Nのアソシエーション
      it '1:Nの関係' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'Audited::Audit'
      end
    end
  end
end
