class ModelsController < ApplicationController
  before_action :find_model, only: %i[show edit update destroy]

  def index
    @models = Model.all
    render json: @models , except: [:created_at, :updated_at]
  end

  def show
    render json: model, except: [:created_at, :updated_at]
  end

  def new
    @model = Model.new
  end

  def edit; end

  def create
    model = Model.create model_params
    render json: model, except: [:created_at, :updated_at]
  end

  def update
    @model.update model_params
    render json: model, except: [:created_at, :updated_at]
  end

  def destroy
    @model.destroy
  end

  private

  def find_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(
      :name,
      :movement,
      :weapon_skill,
      :w,
      :strength,
      :toughness,
      :wounds,
      :attacks,
      :leadership,
      :armour_save,
      :points,
      ability_ids:[],
      abilities_attributes:[:name],
      keyword_ids:[],
      keywords_ids:[:name],
      wargear_option_ids:[],
      wargear_options_ids:[:option],
      weapon_ids:[],
      weapons_attributes:[:weapon_name],
      unit_ids:[],
      units_ids:[:name])
  end
end
