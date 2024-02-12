# ゲストログイン用アカウント
guest_user = Farmer.new(
  email: "noukou@gmail.com",
  password: "156464",
  password_confirmation: "156464",
  last_name: "見本",
  first_name: "太郎",
  last_name_kana: "ミホン",
  first_name_kana: "タロウ",
  farm_name: "サンプル農場",
  crop: "夏おとめ",
)
guest_user.save!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
