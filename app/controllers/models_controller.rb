class ModelsController < ApplicationController
  before_action :find_model, only: %i[show edit update destroy]

  def create
    model = Model.create model_params
    model.user = @current_user
    if model.valid?
        model.save
      #   ,
      # ability_ids:[],
      # wargear_option_ids:[],
      # weapon_ids:[],
      # keyword_ids:[],
      # unit_ids:[]
        model.weapon_ids = params[:model][:weapon_ids]
        model.ability_ids = params[:model][:ability_ids]
        model.keyword_ids = params[:model][:keyword_ids]
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

  def update
    @model.update model_params
    render json: model, except: [:created_at, :updated_at]
  end

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
      :ballistic_skill,
      :strength,
      :toughness,
      :wounds,
      :attacks,
      :leadership,
      :armour_save,
      :points,
      :user_id
    )
  end
end
