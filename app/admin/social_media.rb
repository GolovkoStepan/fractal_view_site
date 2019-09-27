ActiveAdmin.register SocialMedia do

  menu label: "Соц. ресурсы"

  permit_params :site_name, :site_url, :icon_class

  index do
    selectable_column
    column :id
    column :site_name
    column :site_url
    column :icon_class
    column "Дата создания", :created_at
    column "Дата изменения", :updated_at
    actions
  end

end