
class WargearOptionsController < ApplicationController
  before_action :find_wargear_option, only: %i[show edit update destroy]

  def create
    wargear_option = WargearOption.create wargear_option_params
    wargear_option.user = @current_user
    if wargear_option.valid?
        wargear_option.save
        render json: wargear_option, status: :created
    else
        render json: { errors: wargear_option.errors.full_messages }, status: :not_accepted
    end
  end

  def index
-    render json: WargearOption.all
  end

  def show
    wargear_option = WargearOption.find_by_id params[:id]
    render json: wargear_option, except: [:created_at, :updated_at]
  end

  # def new
  #   @wargear_option = WargearOption.new
  # end

  # def edit; end

  # def update
  #   @wargear_option.update wargear_option_params
  #   render json: wargear_option, except: [:created_at, :updated_at]
  # end

  # def destroy
  #   @wargear_option.destroy
  # end

  private

  def find_wargear_option
    @wargear_option = WargearOption.find(params[:id])
  end

  def wargear_option_params
    params.require(:wargear_option).permit(:option, :user_id, :model_ids[], :unit_ids [])
  end
end
