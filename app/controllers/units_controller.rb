
class UnitsController < ApplicationController
  before_action :find_unit, only: %i[show edit update destroy]

  def create
    unit = Unit.create unit_params
    unit.user = @current_user
    if unit.valid?
        unit.save
        unit.model_ids = params[:unit][:model_ids]
        unit.ability_ids = params[:unit][:ability_ids]
        unit.faction_keyword_ids = params[:unit][:faction_keyword_ids]
        unit.save
        render json: unit, status: :created
    else
        render json: { errors: unit.errors.full_messages }, status: :not_accepted
    end
  end

  def index
    render json: Unit.all
  end

  def show
    unit = Unit.find_by_id params[:id]
    render json: unit, except: [:created_at, :updated_at]
  end

  # def new
  #   @unit = Unit.new
  # end

  # def edit; end

  # def update
  #   @unit.update unit_params
  #   render json: unit, except: [:created_at, :updated_at]
  # end

  # def destroy
  #   @unit.destroy
  # end

  private

  def find_unit
    @unit = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(
            :name,
            :composition,
            :user_id
    )
  end
end
