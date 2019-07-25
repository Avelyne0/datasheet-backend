
class KeywordsController < ApplicationController
  before_action :find_keyword, only: %i[show edit update destroy]

  def index
    @keywords = Keyword.all
    render json: @keywords , except: [:created_at, :updated_at]
  end

  def show
    render json: keyword, except: [:created_at, :updated_at]
  end

  def new
    @keyword = Keyword.new
  end

  def edit; end

  def create
    keyword = Keyword.create keyword_params
    render json: keyword, except: [:created_at, :updated_at]
  end

  def update
    @keyword.update keyword_params
    render json: keyword, except: [:created_at, :updated_at]
  end

  def destroy
    @keyword.destroy
  end

  private

  def find_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:name, :user_id, model_ids:[], models_attributes:[:name])
  end
end
