namespace :auto_stock do
  desc "商品の在庫を500にリセットするタスク"
  task item: :environment do
    Item::Stock.batch
  end
end
