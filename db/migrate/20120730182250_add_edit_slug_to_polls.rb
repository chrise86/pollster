class AddEditSlugToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :edit_slug, :string
  end
end
