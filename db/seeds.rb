# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveStorage::AnalyzeJob.queue_adapter = :inline
ActiveStorage::PurgeJob.queue_adapter = :inline


# 店舗データ
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
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/aichi.png"), filename:"aichi.png")
)

#3
store = Store.create!(
  name: "世界一美味しいラーメン!",
  sale_area_id: "2",
  email: "ramen@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/ramen.png"), filename:"ramen.png")
)

#4
store = Store.create!(
  name: "フルーツ王国",
  sale_area_id: "2",
  email: "fruits@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/fruits.png"), filename:"fruits.png")
)

#5
store = Store.create!(
  name: "丼DON",
  sale_area_id: "1",
  email: "don@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/don.png"), filename:"don.png")
)

#6
store = Store.create!(
  name: "カレーマニア",
  sale_area_id: "1",
  email: "kare@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kare.png"), filename:"kare.png")
)

#7
store = Store.create!(
  name: "キッチンぐるぐる",
  sale_area_id: "1",
  email: "guruguru@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/guruguru.png"), filename:"guruguru.png")
)

#8
store = Store.create!(
  name: "Cocktails",
  sale_area_id: "2",
  email: "cocktails@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/cocktails.png"), filename:"cocktails.png")
)

#9
store = Store.create!(
  name: "おさかなやさん",
  sale_area_id: "2",
  email: "osakana@admin",
  password: "111111",
  owner_flag: "false",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/osakana.png"), filename:"osakana.png")
)

# 商品データ
#1
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "家系ラーメン",
  explanation: "1974年以降に登場した神奈川県横浜市発祥の豚骨醤油ベースで太いストレート麺を特徴とするラーメンおよびそのラーメン店群です。 元々屋号に「○○家」とついているところが多かったところから、家系と呼ばれるようになりました。",
  without_tax: "950",
  stock: "3",
  is_active: "true",
  earning: "187",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/ieramen.jpg"), filename:"ieramen.jpg")
)


#2
item = Item.create!(
  store_id: "2",
  category_id: "2",
  name: "麻婆豆腐",
  explanation: "豚ひき肉とねぎ・しょうがのみじん切りを炒めてスープを加え、しょうゆ・豆板醤(トウバンジャン)・豆豉(トウチ)・花椒（中国料理で用いられるさんしょう）などで調味した中に、さいの目に切った豆腐を入れて少し煮込み、水溶き片栗粉でとろみをつけたもの。",
  without_tax: "1250",
  is_active: "true",
  stock: "387",
  earning: "37",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/mabo.jpg"), filename:"mabo.jpg")
)

#3
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "つけ麺",
  explanation: "麺をつゆにつけて食べるスタイルの麺類で、今日においては、主にラーメンの一種ともされる日本の麺料理である。",
  without_tax: "1000",
  is_active: "false",
  stock: "0",
  earning: "43",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/tukemen.jpg"), filename:"tukemen.jpg")
)

#4
item = Item.create!(
  store_id: "5",
  category_id: "2",
  name: "カツ丼",
  explanation: "専用鍋を用いて、切り分けた豚カツを玉ねぎなどと共に割り下（出し汁に醤油・砂糖・みりんなどを加えたもの）で煮て、鶏卵の溶き卵でとじたものを丼飯に乗せたもの。",
  without_tax: "1050",
  is_active: "true",
  stock: "22",
  earning: "108",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/katudon.jpg"), filename:"katudon.jpg")
)

#5
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "いちごクレープ",
  explanation: "洋菓子の一種で小麦粉・牛乳・卵などを混ぜ合わせて溶いた緩い生地をごく薄く焼いたパンケーキでジャムや生クリームなどを包んで食べる。",
  without_tax: "700",
  is_active: "false",
  stock: "0",
  earning: "376",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kurepu.jpg"), filename:"kurepu.jpg")
)

#6
item = Item.create!(
  store_id: "2",
  category_id: "2",
  name: "青椒肉絲",
  explanation: "中国料理の一つ。 ピーマンと豚肉の細切り炒め。 細切りにして下味をつけた豚肉と細切りにしたピーマンやたけのこを油通ししてから炒め、しょうゆ・砂糖・紹興酒・オイスターソースなどの調味料とスープ、水溶き片栗粉を加えて仕上げる。",
  without_tax: "1300",
  is_active: "false",
  stock: "0",
  earning: "492",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/tinjao.jpg"), filename:"tinjao.jpg")
)

#7
item = Item.create!(
  store_id: "2",
  category_id: "2",
  name: "回鍋肉",
  explanation: "「回鍋」は「鍋に戻す」という意味で、すでに調理済みの料理を温め直すこと。 よって本来は、塊のまま一度煮た豚肉を切って鍋に戻し、油で炒め直した料理をいう。 日本における家庭用中華料理としては、豚肉の味噌炒めとみなされていることが多い。",
  without_tax: "1100",
  is_active: "true",
  stock: "456",
  earning: "76",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/hoiko.jpg"), filename:"hoiko.jpg")
)

#8
item = Item.create!(
  store_id: "2",
  category_id: "4",
  name: "餃子",
  explanation: "小麦粉を原料とした皮で、肉・エビ・野菜などで作った餡を包み、茹でる・焼く・蒸す・揚げるなどの方法で調理した食べ物である。成形後の加熱調理方法の違いによって、水（茹で）餃子・焼き餃子・蒸し餃子・揚げ餃子などと呼ばれる。",
  without_tax: "650",
  is_active: "true",
  stock: "327",
  earning: "89",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/gyoza.jpg"), filename:"gyoza.jpg")
)

#9
item = Item.create!(
  store_id: "2",
  category_id: "4",
  name: "焼売",
  explanation: "豚の挽肉を小麦粉の皮で包み蒸し調理した中華料理の点心と日本では認識されているが、後述のように豚肉以外の肉を使うこともあり（肉類を使わないものもある）、皮も小麦粉以外のこともあれば、皮を用いない焼売もあって、明確な定義は存在していない。",
  without_tax: "620",
  is_active: "true",
  stock: "98",
  earning: "320",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/syumai.jpg"), filename:"syumai.jpg")
)

#10
item = Item.create!(
  store_id: "2",
  category_id: "4",
  name: "春巻き",
  explanation: "中国料理のチュンチュワン。 立春につくるチュンピン（春餅）に由来。 小麦粉を薄く円形に焼いて皮とし，豚肉，シイタケ，ニラなどを細切りにしていためたものを入れ，巻き包んで油であげる。 点心の一つで軽食，副菜などにもする。",
  without_tax: "590",
  is_active: "true",
  stock: "2",
  earning: "761",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/harumaki.jpg"), filename:"harumaki.jpg")
)

#10
item = Item.create!(
  store_id: "2",
  category_id: "6",
  name: "台湾ビール",
  explanation: "台湾ビール（たいわんビール、中国語: 台灣啤酒、タイワンピージョウ、英文：Taiwan Beer）は台湾の台湾煙酒公司（中国語版）が醸造・販売しているビールで、台湾最大のビール・ブランドである。",
  without_tax: "740",
  is_active: "false",
  stock: "0",
  earning: "344",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/taiwanbiru.jpg"), filename:"taiwanbiru.jpg")
)

#11
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "台湾ラーメン",
  explanation: "ひき肉とにんにく、ニラや唐辛子などを炒め、醤油ラーメンに加えた辛い麺料理のこと。 名古屋のご当地グルメを名古屋めしと呼びますが、そのなかのひとつとして有名です。",
  without_tax: "880",
  is_active: "true",
  stock: "1",
  earning: "564",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/taiwanramen.jpg"), filename:"taiwanramen.jpg")
)

#12
item = Item.create!(
  store_id: "3",
  category_id: "3",
  name: "博多ラーメン",
  explanation: "豚骨でとった白濁のスープと極細の麺が特徴の、福岡県を代表する名物グルメです。 博多ラーメンのトッピングはシンプルで、途中で紅ショウガや辛子高菜で味を変えて食べるのが一般的。 また、博多ラーメンは、やわらかめから硬めまで、麺の硬さを好みで選べるのも特徴です。",
  without_tax: "950",
  is_active: "false",
  stock: "0",
  earning: "65",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/hakatara.jpg"), filename:"hakatara.jpg")
)

#13
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "アップルパイ",
  explanation: "甘煮にしたりんごをパイ生地で包んだ、いわゆる焼き菓子の1つとされています。 皮はサクッと、中（りんご）はしっとりという食感が特徴。 砂糖のみで味付けされたアップルパイが多い中、シナモンやナツメグといったスパイスを効かせたものもあります。",
  without_tax: "580",
  is_active: "false",
  stock: "0",
  earning: "352",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/appurupai.jpg"), filename:"appurupai.jpg")
)

#14
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "ガトーショコラ",
  explanation: "フランス語で、直訳すると「焼いたチョコレート菓子」という意味になり、本来は焼いて作ったチョコレート菓子全般を指します。 日本では、チョコレートを生地に混ぜ込んで焼いたケーキがガトーショコラと呼ばれています。",
  without_tax: "520",
  is_active: "true",
  stock: "323",
  earning: "156",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/gato.jpg"), filename:"gato.jpg")
)

#15
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "シュークリーム",
  explanation: "中が空洞になるように焼いた生地にカスタードクリームなどを詰めた洋菓子の一種。フランス語で「chou à la crème」（シュー・ア・ラ・クレーム）と呼ばれる菓子である。",
  without_tax: "330",
  is_active: "true",
  stock: "76",
  earning: "76",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/shuuu.jpg"), filename:"shuuu.jpg")
)

#16
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "ドーナツ",
  explanation: "小麦粉が主成分の生地に水・砂糖・バター・卵などを加えたものであり、一般的には、油脂で揚げた揚げ菓子の一種類である。内側はしっとりふんわりしたケーキのような食感のものや、モチモチした食感のものなどがあり、形状はリング状が多く、ボール状のものなどもある。",
  without_tax: "400",
  is_active: "true",
  stock: "498",
  earning: "333",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/donatu.jpg"), filename:"donatu.jpg")
)

#17
item = Item.create!(
  store_id: "4",
  category_id: "5",
  name: "マドレーヌ",
  explanation: "フランス発祥の焼き菓子で、バターケーキの一種。フランスのロレーヌ地方・コメルシーのものが有名です。バニラと柑橘で風味付けされることが多く、バターが甘く香る、ふんわりした素朴な味わいが特徴。",
  without_tax: "440",
  is_active: "false",
  stock: "0",
  earning: "1009",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/madore.jpg"), filename:"madore.jpg")
)

#18
item = Item.create!(
  store_id: "5",
  category_id: "2",
  name: "天丼",
  explanation: "丼鉢に盛った飯の上に天ぷらを載せた日本の丼物。天ぷら丼（てんぷらどんぶり）の略称であるが、今日ではもっぱら「天丼」と呼ばれている。",
  without_tax: "830",
  is_active: "true",
  stock: "367",
  earning: "108",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/tendon.jpg"), filename:"tendon.jpg")
)

#19
item = Item.create!(
  store_id: "5",
  category_id: "2",
  name: "うな重",
  explanation: "鰻丼（うなぎどんぶり、略称:うなどん、英: Charcoal Grilled-Style Unagi Eel on Rice）は、日本の丼料理。丼鉢に盛った白飯の上に鰻の蒲焼を載せたもの。",
  without_tax: "1800",
  is_active: "true",
  stock: "467",
  earning: "439",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/unaju.jpg"), filename:"unaju.jpg")
)

#20
item = Item.create!(
  store_id: "5",
  category_id: "2",
  name: "そぼろ丼",
  explanation: "そぼろ（素朧）は、牛や豚や鶏の挽肉、魚肉やエビをゆでてほぐしたもの、溶き卵などを、そのままあるいは調味して、汁気がなくなりぱらぱらになるまで炒った食品。",
  without_tax: "830",
  is_active: "true",
  stock: "8",
  earning: "552",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/soboro.jpg"), filename:"soboro.jpg")
)

#21
item = Item.create!(
  store_id: "6",
  category_id: "2",
  name: "海鮮カレー",
  explanation: "エビ、ホタテ、イカ、などといった海産物を具として利用したカレーのこと。",
  without_tax: "1300",
  is_active: "true",
  stock: "97",
  earning: "407",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kaikare.jpg"), filename:"kaikare.jpg")
)

#22
item = Item.create!(
  store_id: "6",
  category_id: "2",
  name: "ドライカレー",
  explanation: "水分をいれずに作るカレー。ガーリックライスやバターライスなどと食すことが多い。ドライカレーと米飯を混ぜて炒めることもある。",
  without_tax: "970",
  is_active: "false",
  stock: "0",
  earning: "476",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/karepira.jpg"), filename:"karepira.jpg")
)

#23
item = Item.create!(
  store_id: "6",
  category_id: "2",
  name: "グリーンカレー",
  explanation: "タイ料理の一つ。グリーンカレーペーストを炒め、鶏肉・なすなどの具材、ココナッツミルクを加えて煮込み、ナンプラーなどで味を調えたもの。",
  without_tax: "890",
  is_active: "true",
  stock: "460",
  earning: "33",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/gurikare.jpg"), filename:"gurikare.jpg")
)

#24
item = Item.create!(
  store_id: "7",
  category_id: "1",
  name: "焼肉弁当",
  explanation: "肉は筋肉の材料となるタンパク質源。肉を意識して摂るようにすると筋肉がつきやすくなるので、代謝アップにつながります。",
  without_tax: "1340",
  is_active: "true",
  stock: "1",
  earning: "655",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/yakiben.jpg"), filename:"yakiben.jpg")
)

#25
item = Item.create!(
  store_id: "7",
  category_id: "1",
  name: "幕の内弁当",
  explanation: "白飯と数種類の副食（おかず）からなる弁当である。長い歴史を持ち、細かな定義や特徴については諸説ある。",
  without_tax: "1460",
  is_active: "true",
  stock: "13",
  earning: "1384",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/maku.jpg"), filename:"maku.jpg")
)

#26
item = Item.create!(
  store_id: "7",
  category_id: "1",
  name: "トンカツ弁当",
  explanation: "豚カツ（とんかつ）は、厚みのある豚のロースやヒレのスライス肉を、小麦粉・溶き卵・パン粉をまとわせて食用油で揚げた料理である。",
  without_tax: "1290",
  is_active: "true",
  stock: "15",
  earning: "355",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/tonben.jpg"), filename:"tonben.jpg")
)

#27
item = Item.create!(
  store_id: "8",
  category_id: "6",
  name: "ローザロッサ",
  explanation: "イタリア語で“赤い坂”の意味。命名者は、岡 真木氏。アマレットの琥珀色とやわらかな甘味は、意外と赤ワインと相性がよい。イタリア生まれのアマレットには、渋みの穏やかなイタリアワインを合わせたい。",
  without_tax: "650",
  is_active: "false",
  stock: "444",
  earning: "67",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/roza.jpg"), filename:"roza.jpg")
)

#28
item = Item.create!(
  store_id: "8",
  category_id: "6",
  name: "ブルーキュラソー",
  explanation: "青く着色したキュラソー。ブルーハワイなどのカクテルに用いる。",
  without_tax: "650",
  is_active: "false",
  stock: "0",
  earning: "220",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kyura.jpg"), filename:"kyura.jpg")
)

#29
item = Item.create!(
  store_id: "8",
  category_id: "6",
  name: "テキーラ",
  explanation: "リキュールを楽しむ場合、その殆どがテキーラをベースとしたカクテルです。もちろん、ショットやストレート、ロックなど、割材を使わずに飲まれることもありますが、基本的には蒸留酒ですのでアルコール度数が高く、さまざまなカクテルなどに使用されることが多いようです。",
  without_tax: "520",
  is_active: "true",
  stock: "500",
  earning: "6",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/tekira.jpg"), filename:"tekira.jpg")
)

#30
item = Item.create!(
  store_id: "8",
  category_id: "4",
  name: "日本酒",
  explanation: "原料は主に、米・水・米麹 (デンプンを糖に変える働きを持つカビ菌)・酵母菌 (糖を分解してアルコール発酵させる菌)・乳酸菌をメインに造られています。",
  without_tax: "510",
  is_active: "212",
  stock: "111",
  earning: "786",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/nihonsyu.jpg"), filename:"nihonsyu.jpg")
)

#31
item = Item.create!(
  store_id: "9",
  category_id: "2",
  name: "牡蠣",
  explanation: "生はもちろん、煮ても焼いても揚げても美味しい海の恵み、牡蠣。ぷりぷりの食感と濃厚で深みのある味わいは、ほかの貝類にはない牡蠣特有の魅力です。",
  without_tax: "570",
  is_active: "false",
  stock: "0",
  earning: "1764",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kaki.jpg"), filename:"kaki.jpg")
)

#32
item = Item.create!(
  store_id: "9",
  category_id: "6",
  name: "ネギトロ&サーモン丼",
  explanation: "日本で生まれたマグロを生で食する調理法で、マグロのトロまたは中骨に付く「中落ち」や腹などの「すき身」をたたき、ネギ、サーモンと合わせたものである。",
  without_tax: "970",
  is_active: "true",
  stock: "333",
  earning: "209",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/samonebi.jpg"), filename:"samonebi.jpg")
)

# カテゴリー初期データ
Category.create!(name: "弁当")
Category.create!(name: "丼")
Category.create!(name: "麺類")
Category.create!(name: "ファストフード")
Category.create!(name: "スイーツ")
Category.create!(name: "ドリンク")

# 販売エリア初期データ
SaleArea.create!(name: "内野エリア")
SaleArea.create!(name: "外野エリア")

