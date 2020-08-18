crumb :root do
  link "トップページ", root_path
end

crumb :users_new do
  link "会員情報入力", users_path
  parent :root
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :login do
  link "ログイン", users_path
  parent :root
end

crumb :logout do
  link "ログアウト", edit_user_path
  parent :mypage
end

crumb :items_new do
  link "商品出品", items_path
  parent :mypage
end


crumb :items_show do
  link "商品詳細"
  parent :root
end