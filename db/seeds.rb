# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SocialMedia.create!(site_name: "ВКонтакте", site_url: "https://vk.com/id45986033", icon_class: "fab fa-vk" )

SocialMedia.create!(site_name: "Телеграм", site_url: "https://telegram/@stepangolovko", icon_class: "fab fa-telegram" )

SocialMedia.create!(site_name: "GitHub", site_url: "https://github.com/GolovkoStepan", icon_class: "fab fa-github" )