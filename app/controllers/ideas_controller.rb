class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @category = Category.new
    @idea_category = IdeaCategory.new
  end

  def create
    @idea_category = IdeaCategory.new(idea_params)
    if @idea_category.valid?
      @idea_category.save
      redirect_to action: :index
      render json: idea, status: 201
    else
      render action: :index
    end
  end

  def search
    @ideas = Idea.search(params[:keyword])
  end

  private

  def idea_params
    params.require(:idea_category).permit(:name, :body)
  end
end
