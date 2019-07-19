
class UnitsController < ApplicationController
  before_action :find_unit, only: %i[show edit update destroy]

  def index
    @units = Unit.all
  end

  def show; end

  def new
    @unit = Unit.new
  end

  def edit; end

  def create
    unit = Unit.create unit_params
    redirect_to unit
  end

  def update
    @unit.update unit_params
    redirect_to unit_path(@unit)
  end

  def destroy
    @unit.destroy
    redirect_to units_path
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
