# frozen_string_literal: true

require 'rails_helper'

describe Project do
  describe '#create' do
    it 'name, profile, creator, user_idsの入力は必須' do
      user = create(:user)
      project = create(:project, user_ids: user.id)
      expect(project).to be_valid
    end

    it 'nameなしでの登録はNG' do
      project = build(:project, name: nil)
      project.valid?
      expect(project.errors[:name]).to include('を入力してください')
    end

    it 'profileなしでの登録はNG' do
      project = build(:project, profile: nil)
      project.valid?
      expect(project.errors[:profile]).to include('を入力してください')
    end

    it 'creatorなしでの登録はNG' do
      project = build(:project, creator: nil)
      project.valid?
      expect(project.errors[:creator]).to include('を入力してください')
    end

    it 'user_idsなしでの登録はNG' do
      project = build(:project, user_ids: nil)
      project.valid?
      expect(project.errors[:user_ids]).to include('を入力してください')
    end
  end
end
