
class WeaponsController < ApplicationController
  before_action :find_weapon, only: [:show, :edit, :update, :destroy]

  def create
    weapon = Weapon.create weapon_params
    weapon.user = @current_user
    if weapon.valid?
        weapon.save
        render json: weapon, status: :created
    else
        render json: { errors: weapon.errors.full_messages }, status: :not_accepted
    end
  end

  def index
-    render json: Weapon.all
  end

  def show
    weapon = Weapon.find_by_id params[:id]
    render json: weapon, except: [:created_at, :updated_at]
  end

  # def new
  #   @weapon = Weapon.new
  # end

  # def edit; end

  # def update
  #   @weapon.update weapon_params
  #   render json: weapon, except: [:created_at, :updated_at]
  # end

  # def destroy
  #   @weapon.destroy
  # end

  private

  def find_weapon
    @weapon = Weapon.find(params[:id])
  end

  def weapon_params
    params.require(:weapon).permit(
      :name,
      :weapon_range,
      :weapon_type,
      :weapon_strength,
      :armour_piercing,
      :weapon_damage,
      :weapon_ability,
      :points,
      :user_id,
      model_ids:[]
      )
  end
end
