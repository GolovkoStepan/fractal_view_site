ActiveAdmin.register Post do

  menu label: "Посты"

  permit_params :user_id, :title, :description, :main_picture

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :description
    end

    f.inputs do
      f.input :main_picture, as: :file
    end

    f.actions
  end

  index do
    selectable_column
    column :user
    column :title
    column :description
    column :main_picture
    column "Дата создания", :created_at
    column "Дата изменения", :updated_at
    actions
  end

end