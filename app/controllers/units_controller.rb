
class UnitsController < ApplicationController
  before_action :find_unit, only: %i[show edit update destroy]

  def index
    @units = Unit.all
    render json: @units , except: [:created_at, :updated_at]
  end

  def show
    render json: unit, except: [:created_at, :updated_at]
  end

  def new
    @unit = Unit.new
  end

  def edit; end

  def create
    unit = Unit.create unit_params
    render json: unit, except: [:created_at, :updated_at]
  end

  def update
    @unit.update unit_params
    render json: unit, except: [:created_at, :updated_at]
  end

  def destroy
    @unit.destroy
  end

  private

  def find_unit
    @unit = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(
            :name,
            :composition,
            :user_id,
            model_ids:[],
            models_attributes:[:name],
            ability_ids:[],
            abilities_attributes:[:name],
            faction_keyword_ids:[],
            faction_keywords_attributes:[:name],
            wargear_option_ids:[],
            wargear_options_attributes:[:option])
  end
end
