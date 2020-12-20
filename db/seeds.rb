# frozen_string_literal: true

p 'create Users'
User.create!(
  name: '久保田 太郎',
  email: 'kubota@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2017年4月入社。セールス部門の統括マネージャーです。farmsのアドミンです。',
  position: '統括マネージャー',
  admin: 1,
  current_sign_in_at: '2020-11-10'
)
User.create!(
  name: '鈴木 次郎',
  email: 'suzuki@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2019年4月入社。スモールビジネスアカウント担当。主に新規導入ユーザー案件の統括をしています。',
  position: 'セールスマネージャー',
  current_sign_in_at: '2020-11-10'
)
User.create!(
  name: '野村 三郎',
  email: 'nomura@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2020年9月入社。リテールを中心に見習中です。',
  position: 'セールス',
  current_sign_in_at: '2020-11-10'
)
User.create!(
  name: '嶋田 四郎',
  email: 'shimada@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '嶋田指名のお客様がいらしたらいつでも取り次いでください！',
  position: 'セールス',
  current_sign_in_at: '2020-11-10'
)
User.create!(
  name: '後藤 悠',
  email: 'goto@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '旅が趣味です',
  position: 'セールスアシスタント',
  current_sign_in_at: '2020-11-10'
)
User.create!(
  name: '山口 洋子',
  email: 'yamaguchi@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: 'システムサポート。不具合ありましたらお知らせください',
  position: 'システム部',
  admin: 1,
  current_sign_in_at: '2020-10-01'
)

# 6.times do
#   x += 1
#   user = User.find(x)
#   user.image.attach(io: File.open('app/javascript/images/default_user.png'), filename: 'test.jpg')
# end

p 'create Projects'
Project.create!(
  name: '新規開拓プロジェクト',
  profile: '新規問い合わせ。顧客登録・取引実績なしのみ登録。',
  creator: '久保田 太郎'
)
Project.create!(
  name: '【既存顧客】お得意様応対',
  profile: '既存顧客のうち、年間売上が100万円以上のアカウント。',
  creator: '久保田 太郎'
)
Project.create!(
  name: '販売代理店様提携プロジェクト',
  profile: '代理店の中村アド株式会社様を経由した問い合わせ対応。',
  creator: '久保田 太郎'
)
Project.create!(
  name: '【大型案件】△△県自治体振興プロジェクト',
  profile: '前期からの継続。関連問い合わせは本プロジェクトに統合します',
  creator: '山口 洋子'
)
p 'create Project_Users'
ProjectUser.create!(
  project_id: 1,
  user_id: 1
)
ProjectUser.create!(
  project_id: 1,
  user_id: 2
)
ProjectUser.create!(
  project_id: 2,
  user_id: 1
)
ProjectUser.create!(
  project_id: 3,
  user_id: 1
)
ProjectUser.create!(
  project_id: 3,
  user_id: 5
)
ProjectUser.create!(
  project_id: 4,
  user_id: 2
)
ProjectUser.create!(
  project_id: 4,
  user_id: 3
)
p 'create Post'
Post.create!(
  company_name: 'アイウエオ株式会社',
  prefecture_id: 4,
  company_address: ' 練馬区練馬1-1-1',
  company_url: 'http://test.com',
  contact_person: '田中 一郎',
  phone_number: '03-1111-2222',
  email: 'tanaka@aiueo.net',
  leadstatus_id: 1,
  purchase_date: '2020-11-19',
  product_id: 3,
  contact_reason: '商品導入検討',
  contact_des: '11/19 ホームページを見て問い合わせあり。スペック確認したいとのこと。回答済み。',
  project_id: 1,
  user_id: 1
)
Post.create!(
  company_name: '丸田工業株式会社',
  prefecture_id: 4,
  company_address: ' 練馬区練馬1-1-1',
  company_url: 'http://test.com',
  contact_person: '加藤 一郎',
  phone_number: '03-1111-2222',
  email: 'kato@aiueo.net',
  leadstatus_id: 1,
  purchase_date: '2021-01-20',
  product_id: 3,
  contact_reason: '丸田工業株式会社',
  contact_des: '2020/11/12 河野様より入電。以前にオンラインで作成した仮見積書について社内決済上、押印が必要とのことで対応可否について相談あり。追って連絡する旨お伝え。',
  project_id: 1,
  user_id: 1
)
Post.create!(
  company_name: '三角シティ株式会社',
  prefecture_id: 15,
  company_address: ' 東市1-1-1',
  contact_person: 'ハラ',
  phone_number: '080-1111-2222',
  email: 'hara@aiueo.net',
  leadstatus_id: 2,
  purchase_date: '2021-01-20',
  product_id: 3,
  contact_reason: '新規導入検討',
  contact_des: '2020/11/19 ハラ様より問い合わせ。見積書の作成希望。オンラインの見積もり作成プランを提案し、終話。',
  project_id: 1,
  user_id: 1
)
