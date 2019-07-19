
class WeaponsController < ApplicationController
  before_action :find_weapon, only: [:show, :edit, :update, :destroy]

  def index
    @weapons = Weapon.all
  end

  def new
    @weapon = Weapon.new
  end

  def create
    weapon = Weapon.create weapon_params
    redirect_to new_weapon_path
  end

  def edit
  end

  def show
  end

  def update
    @weapon.update weapon_params
    redirect_to weapon_path(@weapon)
  end

  def destroy
    @weapon.destroy
    redirect_to weapons_path
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
      model_ids:[],
      models_attributes:[:name])
  end
end
