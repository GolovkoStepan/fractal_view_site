class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.boolean :read
      t.belongs_to :user, null: false, foreign_key: true
      t.references :subject, polymorphic: true, null: true

      t.timestamps
    end
  end
end
