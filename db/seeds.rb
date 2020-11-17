p "create Users"
  User.create!(
  name: '久保田 太郎',
  email: 'kubota@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2017年4月入社。セールス部門の統括マネージャーです。farmsのアドミンです。',
  position: '統括マネージャー',
  admin: 1
  )
  User.create!(
  name: '鈴木 次郎',
  email: 'suzuki@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2019年4月入社。スモールビジネスアカウント担当。主に新規導入ユーザー案件の統括をしています。',
  position: 'セールスマネージャー'
  )
  User.create!(
  name: '野村 三郎',
  email: 'nomura@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  profile: '2020年9月入社。リテールを中心に見習中です。',
  position: 'セールスアシスタント'
  )
p "create Projects"
  Project.create!(
  name: '新規開拓プロジェクト',
  profile: '新規問い合わせ。顧客登録・取引実績なしのみ登録。',
  )
p "create Project_Users"
  ProjectUser.create!(
  project_id: 1,
  user_id: 1
  )
p "create Post"
Post.create!(
company_name: 'アイウエオ株式会社',
prefecture_id: 4,
company_address: ' 練馬区練馬1-1-1',
company_url: 'http://test.com',
contact_person: '田中　一郎',
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

