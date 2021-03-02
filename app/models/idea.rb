class Idea < ApplicationRecord
  belongs_to :category

  def self.search(search)
    if search != ''
      category = Category.where(name: search)
      @ideas = Idea.where(category_id: category)
    else
      Category.all
      @ideas = Idea.all
    end
  end
end
