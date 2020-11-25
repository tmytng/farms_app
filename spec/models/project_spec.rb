require 'rails_helper'

describe Project do
  describe '#create' do

    it "name, profile, creatorの入力は必須" do
      user = build(:user)
      project = build(:project)
      expect(project).to be_valid
    end
  end
end
