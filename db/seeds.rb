# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Area.create(:name => '鶴舞')
Area.create(:name => '吹上')
Area.create(:name => '御器所')
Area.create(:name => '荒畑')
Area.create(:name => '千種')

Category.create(:name => 'ラーメン')
Category.create(:name => 'まぜそば')
Category.create(:name => 'つけ麺')
Category.create(:name => 'チャーハン')
Category.create(:name => '餃子')
Category.create(:name => 'そば')
Category.create(:name => 'うどん')
Category.create(:name => '中華')
Category.create(:name => '定食')
Category.create(:name => 'カレー')
Category.create(:name => 'カフェ・喫茶店')
Category.create(:name => 'イタリアン')
Category.create(:name => 'ジャンクフード')
Category.create(:name => 'ハンバーガー')
Category.create(:name => '焼肉')
Category.create(:name => 'どんぶり')
Category.create(:name => '寿司')
Category.create(:name => 'コンビニ')
Category.create(:name => '軽食')
Category.create(:name => 'ファミレス')
Category.create(:name => '手羽先')
Category.create(:name => '揚げ物')
Category.create(:name => '隠れ家')
Category.create(:name => '居酒屋')

Shop.create(:name => "shop1", :address => "toriaezu", :latitude => "35.1527163106303", :longitude => "136.930525302887")
Shop.create(:name => "shop2", :address => "toriaezu", :latitude => "35.1527163106303", :longitude => "136.930525302887")
Shop.create(:name => "shop3", :address => "toriaezu", :latitude => "35.1527163106303", :longitude => "136.930525302887")
Shop.create(:name => "shop4", :address => "toriaezu", :latitude => "35.1527163106303", :longitude => "136.930525302887")
Shop.create(:name => "shop5", :address => "toriaezu", :latitude => "35.1527163106303", :longitude => "136.930525302887")
Shop.create(:name => "向日葵", :address => "愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1", :latitude => "35.156372", :longitude => "136.915262")
Shop.create(:name => "ムガルパレス ２号店", :address => "愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F", :latitude => "35.160022", :longitude => "136.920181")
Shop.create(:name => "炭火やきとり 豆鳥", :address => "愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F", :latitude => "35.158431", :longitude => "136.917331")
Shop.create(:name => "鶴舞Perch", :address => "愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F", :latitude => "35.154151", :longitude => "136.914681")
Shop.create(:name => "広島鉄板居酒屋 来い鯉", :address => "愛知県 名古屋市中区 千代田 3-12-5", :latitude => "35.155731", :longitude => "136.916659")
Shop.create(:name => "もつ焼き百蔵", :address => "愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F", :latitude => "35.155667", :longitude => "136.915743")
Shop.create(:name => "焼肉市場さくら×さくら", :address => "愛知県名古屋市中区新栄２-47-50", :latitude => "35.16175", :longitude => "136.922447")
Shop.create(:name => "鳥貴族 鶴舞店", :address => "愛知県 名古屋市中区 千代田 3-11-9 2F", :latitude => "35.155659", :longitude => "136.915315")
Shop.create(:name => "笑笑 鶴舞駅前店", :address => "愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F", :latitude => "35.15585", :longitude => "136.915551")





User.create(:email => 'test1@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test2@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test3@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test4@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test5@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test6@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test7@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test8@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test9@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test10@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test11@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test12@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test13@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test14@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test15@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test16@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test17@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test18@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test19@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test20@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test21@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test22@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test23@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test24@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test25@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test26@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test27@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test28@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test29@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test30@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test31@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test32@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test33@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test34@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test35@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test36@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test37@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test38@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test39@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test40@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test41@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test42@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test43@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test44@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test45@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test46@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test47@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test48@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test49@test.com', :password =>  'password', :password_confirmation => 'password')
User.create(:email => 'test50@test.com', :password =>  'password', :password_confirmation => 'password')



1.upto(50){ |i|
    Mypage.create(:name => %(test"#{i}"), :user_id => i)
}





1.upto(10){ |i|
    User.find("1").age(Shop.find(i))
    User.find("1").want(Shop.find(i))
}