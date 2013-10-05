#encoding: windows-1251
FactoryGirl.define do
  factory :order do
    association(:user)
  end
end