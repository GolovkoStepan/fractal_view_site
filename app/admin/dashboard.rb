ActiveAdmin.register_page "Dashboard" do

  menu label: "Главная панель"

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Пользователи: #{User.count}"
        br
        span "Посты: #{Post.count}"
        br
        span "Комментарии: #{Comment.count}"
        br
        span "Уведомления: #{Notification.count}"
      end
    end
  end

end
