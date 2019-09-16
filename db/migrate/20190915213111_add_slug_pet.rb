class AddSlugPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :slug, :string
  end
end
