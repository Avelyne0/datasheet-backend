
class AbilitiesController < ApplicationController
  before_action :find_ability, only: %i[show edit update destroy]

  def index
    @abilities  = Ability.all
    render json: @abilities , except: [:created_at, :updated_at]
  end

  def show
    ability = Ability.find_by_id params[:id]
    render json: ability, except: [:created_at, :updated_at]
  end

  def new
    @ability = Ability.new
  end

  def edit; end

  def create
    ability = Ability.create ability_params
    render json: ability, except: [:created_at, :updated_at]
  end

  def update
    @ability.update ability_params
    render json: ability, except: [:created_at, :updated_at]
  end

  def destroy
    @ability.destroy
  end

  private

  def find_ability
    @ability = Ability.find(params[:id])
  end

  def ability_params
    params.require(:ability).permit(:name, :content, model_ids:[])
  end
end
