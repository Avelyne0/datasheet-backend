
class KeywordsController < ApplicationController
  before_action :find_keyword, only: %i[show edit update destroy]

  def index
    @keywords = Keyword.all
  end

  def show; end

  def new
    @keyword = Keyword.new
  end

  def edit; end

  def create
    keyword = Keyword.create keyword_params
    redirect_to new_keyword_path
  end

  def update
    @keyword.update keyword_params
    redirect_to keyword_path(@keyword)
  end

  def destroy
    @keyword.destroy
    redirect_to keywords_path
  end

  private

  def find_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:name, model_ids:[], models_attributes:[:name])
  end
end
