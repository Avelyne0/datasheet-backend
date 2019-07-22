
class WargearOptionsController < ApplicationController
  before_action :find_wargear_option, only: %i[show edit update destroy]

  def index
    @wargear_options = WargearOption.all
    render json: @wargear_options , except: [:created_at, :updated_at]
  end

  def show
    render json: wargear_option, except: [:created_at, :updated_at]
  end

  def new
    @wargear_option = WargearOption.new
  end

  def edit; end

  def create
    wargear_option = WargearOption.create wargear_option_params
    render json: wargear_option, except: [:created_at, :updated_at]
  end

  def update
    @wargear_option.update wargear_option_params
    render json: wargear_option, except: [:created_at, :updated_at]
  end

  def destroy
    @wargear_option.destroy
  end

  private

  def find_wargear_option
    @wargear_option = WargearOption.find(params[:id])
  end

  def wargear_option_params
    params.require(:wargear_option).permit(:option, :model_ids[], :unit_ids [])
  end
end
