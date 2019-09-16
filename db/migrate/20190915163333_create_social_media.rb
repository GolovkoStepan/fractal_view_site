class CreateSocialMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media do |t|
      t.string :site_name
      t.string :site_url
      t.string :icon_class

      t.timestamps
    end
  end
end
