
class WargearOptionsController < ApplicationController
  before_action :find_wargear_option, only: %i[show edit update destroy]

  def index
    @wargear_options = WargearOption.all
  end

  def show; end

  def new
    @wargear_option = WargearOption.new
  end

  def edit; end

  def create
    wargear_option = WargearOption.create wargear_option_params
    redirect_to wargear_option
  end

  def update
    @wargear_option.update wargear_option_params
    redirect_to wargear_option_path(@wargear_option)
  end

  def destroy
    @wargear_option.destroy
    redirect_to wargear_options_path
  end

  private

  def find_wargear_option
    @wargear_option = WargearOption.find(params[:id])
  end

  def wargear_option_params
    params.require(:wargear_option).permit(:option, :model_ids[], :unit_ids []
      )
  end
end
