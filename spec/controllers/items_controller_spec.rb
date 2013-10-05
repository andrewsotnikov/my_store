#encoding: windows-1251
require 'spec_helper'

describe ItemsController do
  describe "show action" do
    it "генерация шаблона, если товар найден" do
      item = create(:item)
      get :show, locale: I18n.locale, id: item.id
      expect(response).to render_template(:show)
    end    
    
    it "генерация ошибки, если товар не найден" do
      get :show, locale: I18n.locale, id: 0
      expect(response.status).to eq(404)
    end
  end
  
  describe "create action" do
    it "переход к добавленному товару при его создании" do
      post :create, locale: I18n.locale, item: {name: "item 1", description: "description 1"}
      expect(response).to redirect_to item_path(assigns(:item))
    end
    
    it "переход к форме добавления товара при ошибке" do
      post :create, locale: I18n.locale, item: {name: nil}
      expect(response).to render_template(:new)
    end
  end
end
