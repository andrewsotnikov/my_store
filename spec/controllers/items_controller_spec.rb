#encoding: windows-1251
require 'spec_helper'

describe ItemsController do
  describe "show action" do
    it "��������� �������, ���� ����� ������" do
      item = create(:item)
      get :show, locale: I18n.locale, id: item.id
      expect(response).to render_template(:show)
    end    
    
    it "��������� ������, ���� ����� �� ������" do
      get :show, locale: I18n.locale, id: 0
      expect(response.status).to eq(404)
    end
  end
  
  describe "create action" do
    it "������� � ������������ ������ ��� ��� ��������" do
      post :create, locale: I18n.locale, item: {name: "item 1", description: "description 1"}
      expect(response).to redirect_to item_path(assigns(:item))
    end
    
    it "������� � ����� ���������� ������ ��� ������" do
      post :create, locale: I18n.locale, item: {name: nil}
      expect(response).to render_template(:new)
    end
  end
end
