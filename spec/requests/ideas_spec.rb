require 'rails_helper'
RSpec.describe IdeaCategory, type: :request do
  describe 'POST #create' do
    before do
      @idea_category = FactoryBot.build(:idea_category)
    end
    it '成功時ステータスコード201を返す' do
      post ideas_path
      expect(response.status).to eq(201)
    end
    it '失敗時ステータスコード422を返す' do
      post ideas_path
      expect(response.status).to eq(422)
    end
  end
  describe 'POST #search' do
    it '登録されていないカテゴリーのリクエストの場合ステータスコード404を返す' do
      post search_ideas_path
      expect(response.status).to eq(404)
    end
  end
end
