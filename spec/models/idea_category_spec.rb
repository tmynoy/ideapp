require 'rails_helper'

RSpec.describe IdeaCategory, type: :model do
  before do
    @idea_category = FactoryBot.build(:idea_category)
  end
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@idea_category).to be_valid
  end
  it 'nameが空だと保存できないこと' do
    @idea_category.name = ''
    @idea_category.valid?
    expect(@idea_category.errors.full_messages).to include("Name can't be blank")
  end
  it 'bodyが空だと保存できないこと' do
    @idea_category.name = ''
    @idea_category.body = ''
    @idea_category.valid?
    expect(@idea_category.errors.full_messages).to include("Body can't be blank")
  end
  it '正常に保存できないとステータスコード422を返すこと' do
    @idea_category.name = ''
    expect(response.status).to eq 422
  end
end
