# ゲストログイン用アカウント
# 既存のゲストユーザーを特定して更新する
guest_user = Farmer.find_by(email: "noukou@gmail.com")
unless guest_user
  guest_user = Farmer.create!(
    email: "noukou@gmail.com",
    password: "156464",
    last_name: "見本",
    first_name: "太郎",
    last_name_kana: "ミホン",
    first_name_kana: "タロウ",
    farm_name: "サンプル農場",
    crop: "夏おとめ"
  )
else
  guest_user.update!(
    password: "156464",
    last_name: "見本",
    first_name: "太郎",
    last_name_kana: "ミホン",
    first_name_kana: "タロウ",
    farm_name: "サンプル農場",
    crop: "夏おとめ"
  )
end

# Farmlandの作成
farmland_a = Farmland.create!(
  farmer_id: guest_user.id,
  land: "単棟ハウスA",
  area: "50m×4",
  overview: "説明を記入 例:冷熱設備有イチゴ用"
)

farmland_b = Farmland.create!(
  farmer_id: guest_user.id,
  land: "単棟ハウスB",
  area: "50m×4",
  overview: "説明を記入 例:冷熱設備有イチゴ用"
)

farmland_c = Farmland.create!(
  farmer_id: guest_user.id,
  land: "単棟ハウスC",
  area: "50m×4",
  overview: "説明を記入 例:冷熱設備有イチゴ用"
)

# Pesticideの作成
pesticide_1 = Pesticide.create!(
  farmer_id: guest_user.id,
  name: "農薬1",
  code: "殺虫5",
  subject: "アザミウマ・ハダニ",
  use_method: "希釈散布",
  magnification: "2000倍",
  usable_number: 3
)

pesticide_2 = Pesticide.create!(
  farmer_id: guest_user.id,
  name: "農薬2",
  code: "無し",
  subject: "うどんこ病",
  use_method: "希釈散布",
  magnification: "2000倍",
  usable_number: 10
)

# Recordの作成
Record.create!(
  farmer_id: guest_user.id,
  farmland_id: farmland_a.id,
  pesticide_id: pesticide_1.id,
  day: Date.new(2024, 4, 1),
  name: "農薬1",
  subject: "アザミウマ・ハダニ",
  code: "殺虫5",
  land: "単棟ハウスA",
  amount: "250ml",
  water: "500L",
  user: "サンプルユーザー",
  confimer: "サンプル承認者"
)

Record.create!(
  farmer_id: guest_user.id,
  farmland_id: farmland_b.id,
  pesticide_id: pesticide_1.id,
  day: Date.new(2024, 4, 1),
  name: "農薬1",
  subject: "アザミウマ・ハダニ",
  code: "殺虫5",
  land: "単棟ハウスB",
  amount: "250ml",
  water: "500L",
  user: "サンプルユーザー",
  confimer: "サンプル承認者"
)

Record.create!(
  farmer_id: guest_user.id,
  farmland_id: farmland_a.id,
  pesticide_id: pesticide_1.id,
  day: Date.new(2024, 4, 5),
  name: "農薬1",
  subject: "アザミウマ・ハダニ",
  code: "殺虫5",
  land: "単棟ハウスA",
  amount: "250ml",
  water: "500L",
  user: "サンプルユーザー",
  confimer: "サンプル承認者"
)

Record.create!(
  farmer_id: guest_user.id,
  farmland_id: farmland_a.id,
  pesticide_id: pesticide_1.id,
  day: Date.new(2025, 1, 1),
  name: "農薬1",
  subject: "アザミウマ・ハダニ",
  code: "殺虫5",
  land: "単棟ハウスA",
  amount: "250ml",
  water: "500L",
  user: "サンプルユーザー",
  confimer: "サンプル承認者"
)

Season.create!(
  farmer_id: guest_user.id,
  start_date: Date.new(2024, 4, 1),
  end_date: Date.new(2024, 12, 31)
)





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
