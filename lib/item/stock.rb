module Item::Stock extend self
  def batch
    @items = Item.all
    @items.each do |item|
      item.stock = 500
      item.is_active = true
      item.save
    end
  end
end