# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Area.create(:name => '全体')
Area.create(:name => '鶴舞')
Area.create(:name => '吹上')
Area.create(:name => '御器所')
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