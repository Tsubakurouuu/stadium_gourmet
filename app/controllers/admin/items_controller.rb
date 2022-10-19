class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin_store!, only: [:new, :show, :edit]
  def new
    @item = Item.new
    if current_admin_store.owner_flag == true
      flash[:alert] = "サイト管理者は商品の新規登録ができません。"
      redirect_to admin_stores_path
      return
    end
    unless params[:store_id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗の商品登録はできません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
  end

  def create
    store = Store.find(params[:store_id])
    @item = current_admin_store.items.new(item_params)
    @item.store_id = store.id
    if @item.save
      flash[:notice] = "商品の登録が完了しました。"
      redirect_to admin_store_item_path(store.id, @item.id)
    else
      render :new
    end
  end

  def show
    if current_admin_store.owner_flag == true
      unless Item.exists?(params[:id])
        flash[:alert] = "商品が存在しません。"
        redirect_to admin_stores_path
        return
      end
      @item = Item.find(params[:id])
      @store = Store.find(params[:store_id])
      return
    end
    unless params[:store_id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗の商品は閲覧できません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    unless Item.exists?(params[:id])
      flash[:alert] = "商品が存在しません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    @item = Item.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def edit
    if current_admin_store.owner_flag == true
      flash[:alert] = "サイト管理者は商品の編集ができません。"
      redirect_to admin_stores_path
      return
    end
    unless params[:store_id].to_i == current_admin_store.id
      flash[:alert] = "他の店舗の商品は編集できません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    unless Item.exists?(params[:id])
      flash[:alert] = "商品が存在しません。"
      redirect_to admin_store_path(current_admin_store.id)
      return
    end
    @item = Item.find(params[:id])
    @store = Store.find_by(id: @item.store_id)
  end

  def update
    store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の編集が完了しました。"
      redirect_to admin_store_item_path(store.id, @item.id)
    else
      render :edit
    end
  end

  def destroy
    store = Store.find(params[:store_id])
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "商品の削除が完了しました。"
    redirect_to admin_store_path(store.id)
  end

  private
  def item_params
    params.require(:item).permit(:store_id, :category_id, :name, :explanation, :without_tax, :image)
  end
end
