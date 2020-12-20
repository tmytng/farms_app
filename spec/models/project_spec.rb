# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'ActiveStrageテスト' do
    before do
      @project = build(:project)
      @project.prj_image = fixture_file_upload('/files/test.png')
    end
    it 'プロジェクトイメージの登録ができる' do
      expect(@project).to be_valid
    end
  end

  describe 'バリデーションテスト' do
    subject { test_project.valid? }
    let(:project) { create(:project) }
    let(:project2) { create(:project) }

    context 'name' do
      let(:test_project) { project }
      let(:test_project2) { project2 }

      it '空欄でないこと' do
        test_project.name = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_project.name = ''
        test_project.valid?
        expect(test_project.errors[:name]).to include('を入力してください')
      end
      it '一意であること' do
        test_project.name = 'テスト'
        test_project.save
        test_project2.name = 'テスト'
        test_project2.save
        test_project2.valid?
        expect(test_project2).to be_invalid
      end
      it '一意でない場合はエラーが出る' do
        test_project.name = 'テスト'
        test_project.save
        test_project2.name = 'テスト'
        test_project2.save
        test_project2.valid?
        expect(test_project2.errors[:name]).to include('はすでに存在します')
      end
      it '30文字以内であること' do
        test_project.name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
      it '31文字以上の場合はエラーが出る' do
        test_project.name = Faker::Lorem.characters(number: 31)
        test_project.valid?
        expect(test_project.errors[:name]).to include('は30文字以内で入力してください')
      end
    end

    context 'profile' do
      let(:test_project) { project }

      it '空欄でないこと' do
        test_project.profile = ''
        is_expected.to eq false
      end
      it '200文字以内であること' do
        test_project.profile = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
      it '201文字以上の場合はエラーが出る' do
        test_project.profile = Faker::Lorem.characters(number: 201)
        test_project.valid?
        expect(test_project.errors[:profile]).to include('は200文字以内で入力してください')
      end
    end

    context 'creator' do
      let(:test_project) { project }

      it '空欄でないこと' do
        test_project.creator = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
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
    context 'ProjectUserモデルとのアソシエーション' do
      let(:target) { :project_users }
      it '1:Nの関係（中間テーブル）' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'ProjectUser'
      end
    end
    context 'Userモデルとのアソシエーション' do
      let(:target) { :users }
      it 'N:Nの関係（中間テーブルが介在）' do
        expect(association.macro).to eq :has_many
      end
      it '関連づけられたクラス名' do
        expect(association.class_name).to eq 'User'
      end
    end
    # context 'Auditモデルとのアソシエーション' do
    #   let(:target) { :audits }
    #   it 'N:Nの関係（中間テーブルが介在）' do
    #     expect(association.macro).to eq :has_associated
    #   end
    #   it '関連づけられたクラス名' do
    #     expect(association.class_name).to eq 'Audit'
    #   end
    # end
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
