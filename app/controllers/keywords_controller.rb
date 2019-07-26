
class KeywordsController < ApplicationController
  before_action :find_keyword, only: %i[show edit update destroy]

  def create
    keyword = Keyword.create keyword_params
    keyword.user = @current_user
    if keyword.valid?
        keyword.save
        render json: keyword, status: :created
    else
        render json: { errors: keyword.errors.full_messages }, status: :not_accepted
    end
  end

  def index
-    render json: Keyword.all
  end

  def show
    keyword = Keyword.find_by_id params[:id]
    render json: keyword, except: [:created_at, :updated_at]
  end

  # def new
  #   @keyword = Keyword.new
  # end

  # def edit; end

  # def update
  #   @keyword.update keyword_params
  #   render json: keyword, except: [:created_at, :updated_at]
  # end

  # def destroy
  #   @keyword.destroy
  # end

  private

  def find_keyword
    @keyword = Keyword.find(params[:id])
  end

  def keyword_params
    params.require(:keyword).permit(:name, :user_id, model_ids:[], models_attributes:[:name])
  end
end
