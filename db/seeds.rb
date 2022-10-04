# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#店舗データ
Store.create!(
  name: '管理人',
  email: 'admin@admin',
  password: '111111',
  owner_flag: "true",
)

Store.create!(
  name: '牛肉専門店',
  sale_area_id: '3',
  email: 'gyuniku@admin',
  password: '111111',
  owner_flag: "false",
)

Store.create!(
  name: '美味しいラーメン屋さん',
  sale_area_id: '4',
  email: 'ramen@admin',
  password: '111111',
  owner_flag: "false",
)

#カテゴリー初期データ
Category.create!(name: "弁当")
Category.create!(name: "丼")
Category.create!(name: "麺類")
Category.create!(name: "ファストフード")
Category.create!(name: "スイーツ")
Category.create!(name: "ドリンク")

#販売エリア初期データ
SaleArea.create!(name: "バックネット裏")
SaleArea.create!(name: "一塁側")
SaleArea.create!(name: "三塁側")
SaleArea.create!(name: "レフト側")
SaleArea.create!(name: "ライト側")
