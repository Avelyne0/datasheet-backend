
class FactionKeywordsController < ApplicationController
  before_action :find_faction_keyword, only: %i[show edit update destroy]

  def index
    @abilities = FactionKeyword.all
  end

  def show; end

  def new
    @faction_keyword = FactionKeyword.new
  end

  def edit; end

  def create
    faction_keyword = FactionKeyword.create faction_keyword_params
    redirect_to new_faction_keyword_path
  end

  def update
    @faction_keyword.update faction_keyword_params
    redirect_to faction_keyword_path(@faction_keyword)
  end

  def destroy
    @faction_keyword.destroy
    redirect_to faction_keywords_path
  end

  private

  def find_faction_keyword
    @faction_keyword = FactionKeyword.find(params[:id])
  end

  def faction_keyword_params
    params.require(:faction_keyword).permit(:name, :unit_ids [])
  end
end

