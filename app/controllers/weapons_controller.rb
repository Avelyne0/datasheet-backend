
class WeaponsController < ApplicationController
  before_action :find_weapon, only: [:show, :edit, :update, :destroy]

  def index
    @weapons = Weapon.all
    render json: @weapons , except: [:created_at, :updated_at]
  end

  def show
    render json: weapon, except: [:created_at, :updated_at]
  end

  def new
    @weapon = Weapon.new
  end

  def edit; end

  def create
    weapon = Weapon.create weapon_params
    render json: weapon, except: [:created_at, :updated_at]
  end

  def update
    @weapon.update weapon_params
    render json: weapon, except: [:created_at, :updated_at]
  end

  def destroy
    @weapon.destroy
  end

  private

  def find_weapon
    @weapon = Weapon.find(params[:id])
  end

  def weapon_params
    params.require(:weapon).permit(
      :weapon_name,
      :weapon_range,
      :weapon_type,
      :weapon_strength,
      :armour_piercing,
      :weapon_damage,
      :weapon_ability,
      :points,
      :user_id,
      model_ids:[],
      models_attributes:[:name])
  end
end
