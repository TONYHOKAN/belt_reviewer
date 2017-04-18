class AddOwnerToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :user_id, :reference, index: true
  end
end
