ActiveAdmin.register User do

  menu label: "Пользователи"

  permit_params :first_name, :last_name, :gender, :bio, :status, :role, :email, :date_of_birth, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :gender, as: :select, collection: [ ["Мужской", "male"], ["Женский", "female"] ]
      f.input :date_of_birth, as: :datepicker
      f.input :status
      f.input :role, as: :select, collection: User.translated_roles.map{|k| [k.first, k.second]}
      f.input :bio
    end

    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :gender
    column :date_of_birth
    column :status
    column :role
    column :bio
    column "Дата создания", :created_at
    column "Дата изменения", :updated_at
    actions
  end

end