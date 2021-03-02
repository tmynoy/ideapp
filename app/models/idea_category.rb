class IdeaCategory
  include ActiveModel::Model
  attr_accessor :name, :body

  with_options presence: true do
    validates :name
    validates :body
  end

  def save
    @category = Category.find_by(name: name)
    if @category.present?
      Idea.create(body: body, category_id: @category.id)
    else
      category = Category.create(name: name)
      Idea.create(body: body, category_id: category.id)
    end
  end
end