class ModelsController < ApplicationController
  before_action :find_model, only: %i[show edit update destroy]

  def create
    model = Model.create model_params
    model.user = @current_user
    if model.valid?
        model.save
        render json: model, status: :created
    else
        render json: { errors: model.errors.full_messages }, status: :not_accepted
    end
  end

  def index
    render json: Model.all
  end

  def show
    model = Model.find_by_id params[:id]
    render json: model, except: [:created_at, :updated_at]
  end

  # def new
  #   @model = Model.new
  # end

  # def edit; end

  # def update
  #   @model.update model_params
  #   render json: model, except: [:created_at, :updated_at]
  # end

  # def destroy
  #   @model.destroy
  # end

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
      :user_id,
      ability_ids:[],
      abilities_attributes:[:name],
      model_ids:[],
      models_ids:[:name],
      wargear_option_ids:[],
      wargear_options_ids:[:option],
      weapon_ids:[],
      weapons_attributes:[:weapon_name],
      unit_ids:[],
      units_ids:[:name])
  end
end
