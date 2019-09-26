SocialMedia.create!(site_name: "ВКонтакте", site_url: "https://vk.com/id45986033", icon_class: "fab fa-vk" )
SocialMedia.create!(site_name: "Телеграм", site_url: "https://telegram/@stepangolovko", icon_class: "fab fa-telegram" )
SocialMedia.create!(site_name: "GitHub", site_url: "https://github.com/GolovkoStepan", icon_class: "fab fa-github" )

User.create!(email: "admin@admin.com", password: "123123123", password_confirmation: "123123123", role: "admin")

#p = Post.new
#p.title = "Новое изображение фрактала"
#p.description = "Координаты: 0.843643255732, 0.2374853563475"
#p.main_picture.attach(io: File.open("#{Rails.root}/app/assets/images/fractal_1.png"), filename: 'fractal_1.png')
#p.user = User.find(2)
#p.save!

#ActiveRecord::Base.connection.tables.each do |table_name|
#  ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
#end
