
class FactionKeywordsController < ApplicationController
  before_action :find_faction_keyword, only: %i[show edit update destroy]

def index
  @faction_keywords = FactionKeyword.all
  render json: @faction_keywords , except: [:created_at, :updated_at]
end

def show
  render json: faction_keyword, except: [:created_at, :updated_at]
end

def new
  @faction_keyword = FactionKeyword.new
end

def edit; end

def create
  faction_keyword = FactionKeyword.create faction_keyword_params
  render json: faction_keyword, except: [:created_at, :updated_at]
end

def update
  @faction_keyword.update faction_keyword_params
  render json: faction_keyword, except: [:created_at, :updated_at]
end

def destroy
  @faction_keyword.destroy
end

private

def find_faction_keyword
  @faction_keyword = FactionKeyword.find(params[:id])
end

def faction_keyword_params
  params.require(:faction_keyword).permit(:name, :user_id, :unit_ids [])
end
end

