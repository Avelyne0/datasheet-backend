class AddUserKeyToModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :models, :user, index: true
    add_reference :wargear_options, :user, index: true
    add_reference :abilities, :user, index: true
    add_reference :faction_keywords, :user, index: true
    add_reference :keywords, :user, index: true
    add_reference :weapons, :user, index: true
  end
end
