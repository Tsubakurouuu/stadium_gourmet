# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#店舗データ
#1
Store.create!(
  name: '管理人',
  email: 'admin@admin',
  password: '111111',
  owner_flag: "true",
)
#2
store = Store.create!(
  name: "愛知中華",
  sale_area_id: "1",
  email: "aichi@admin",
  password: "111111",
  owner_flag: "false",
)
store.image.attach(io: File.open(Rails.root.join('app/assets/images/aichi.png')), filename: 'aichi.png')
#3
store = Store.create!(
  name: "世界一美味しいラーメン!",
  sale_area_id: "2",
  email: "ramen@admin",
  password: "111111",
  owner_flag: "false",
)
store.image.attach(io: File.open(Rails.root.join('app/assets/images/ramen.png')), filename: 'ramen.png')
#4
store = Store.create!(
  name: "フルーツ王国",
  sale_area_id: "2",
  email: "fruits@admin",
  password: "111111",
  owner_flag: "false",
)
store.image.attach(io: File.open(Rails.root.join('app/assets/images/fruits.png')), filename: 'fruits.png')
#5
store = Store.create!(
  name: "丼DON",
  sale_area_id: "1",
  email: "don@admin",
  password: "111111",
  owner_flag: "false",
)
store.image.attach(io: File.open(Rails.root.join('app/assets/images/don.png')), filename: 'don.png')

#商品データ
#1
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "世界一美味しい家系ラーメン",
  explanation: "1974年以降に登場した神奈川県横浜市発祥の豚骨醤油ベースで太いストレート麺を特徴とするラーメンおよびそのラーメン店群です。 元々屋号に「○○家」とついているところが多かったところから、家系と呼ばれるようになりました。",
  without_tax: "950",
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/ieramen.jpg')), filename: 'ieramen.jpg')
#2
item = Item.create!(
  store_id: "2",
  category_id: "2",
  name: "最強の麻婆豆腐",
  explanation: "豚ひき肉とねぎ・しょうがのみじん切りを炒めてスープを加え、しょうゆ・豆板醤(トウバンジャン)・豆豉(トウチ)・花椒（中国料理で用いられるさんしょう）などで調味した中に、さいの目に切った豆腐を入れて少し煮込み、水溶き片栗粉でとろみをつけたもの。",
  without_tax: "1250",
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/mabo.jpg')), filename: 'mabo.jpg')
#3
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "世界一美味しいつけ麺",
  explanation: "麺をつゆにつけて食べるスタイルの麺類で、今日においては、主にラーメンの一種ともされる日本の麺料理である。",
  without_tax: "1000",
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/tukemen.jpg')), filename: 'tukemen.jpg')
#4
item = Item.create!(
  store_id: "5",
  category_id: "2",
  name: "カツ丼",
  explanation: "専用鍋を用いて、切り分けた豚カツを玉ねぎなどと共に割り下（出し汁に醤油・砂糖・みりんなどを加えたもの）で煮て、鶏卵の溶き卵でとじたものを丼飯に乗せたもの。",
  without_tax: "1050",
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/katudon.jpg')), filename: 'katudon.jpg')
#5
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "いちごクレープ",
  explanation: "洋菓子の一種で小麦粉・牛乳・卵などを混ぜ合わせて溶いた緩い生地をごく薄く焼いたパンケーキでジャムや生クリームなどを包んで食べる。",
  without_tax: "700",
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/kurepu.jpg')), filename: 'kurepu.jpg')
#カテゴリー初期データ
Category.create!(name: "弁当")
Category.create!(name: "丼")
Category.create!(name: "麺類")
Category.create!(name: "ファストフード")
Category.create!(name: "スイーツ")
Category.create!(name: "ドリンク")

#販売エリア初期データ
SaleArea.create!(name: "内野エリア")
SaleArea.create!(name: "外野エリア")

