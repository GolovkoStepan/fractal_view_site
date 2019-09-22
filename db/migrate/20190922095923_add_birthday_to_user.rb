class AddBirthdayToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :age, :string
    add_column :users, :date_of_birth, :datetime
  end
end
