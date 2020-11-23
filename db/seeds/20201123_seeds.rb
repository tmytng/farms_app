Audited::Audit.create!([
  {auditable_id: 7, auditable_type: "Post", associated_id: nil, associated_type: nil, user_id: 1, user_type: "User", username: nil, action: "create", audited_changes: {"company_name"=>"速修実践株式会社", "prefecture_id"=>"14", "company_address"=>nil, "company_url"=>"", "contact_person"=>"テスト", "phone_number"=>"03-2234-5555", "email"=>"testman@test.com", "leadstatus_id"=>"6", "purchase_date"=>Fri, 27 Nov 2020 00:00:00 JST +09:00, "product_id"=>"2", "add_file"=>nil, "contact_reason"=>"degegge", "contact_des"=>"segs,ese,semg", "project_id"=>1, "user_id"=>1}, version: 1, comment: nil, remote_address: "::1", request_uuid: "00dc326b-fdb9-4ff1-b3fe-a916b3f4fb3b"},
  {auditable_id: 3, auditable_type: "Post", associated_id: nil, associated_type: nil, user_id: 1, user_type: "User", username: nil, action: "update", audited_changes: {"company_name"=>["ドドドド", "ドドドドド"]}, version: 1, comment: nil, remote_address: "::1", request_uuid: "0113b4e4-fc85-453e-9b6e-6530d3d9e68b"},
  {auditable_id: 4, auditable_type: "Post", associated_id: nil, associated_type: nil, user_id: 1, user_type: "User", username: nil, action: "update", audited_changes: {"product_id"=>["2", "3"]}, version: 1, comment: nil, remote_address: "::1", request_uuid: "b3ec76ef-59a1-4ee3-9fa7-f66b547e96ad"}
])
User.create!([
  {email: "kubota@test.com", encrypted_password: "$2a$12$fM94UdO4JtYzuHqo9Ciz9u7nJSh3JoL0M6DEgipvBoK03ZING65dy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2020-11-23 11:35:04", last_sign_in_at: "2020-11-23 06:20:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "久保田 太郎", profile: "2017年4月入社。セールス部門の統括マネージャーです。farmsのアドミンです。", position: "統括マネージャー", image: nil, admin: false},
  {email: "suzuki@test.com", encrypted_password: "$2a$12$CQvw3MLbykkPBnQZiW8MWukVh2covagRgs33oO90ZS.kO975suZPy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 14, current_sign_in_at: "2020-11-23 06:16:13", last_sign_in_at: "2020-11-23 06:14:01", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "鈴木 次郎", profile: "2019年4月入社。スモールビジネスアカウント担当。主に新規導入ユーザー案件の統括をしています。", position: "セールスマネージャー", image: nil, admin: false},
  {email: "nomura@test.com", encrypted_password: "$2a$12$7hk9eb82gsZL/XQDhgCyuuwz/XOCZ3u53VKJoegmZsOfZPJrVVPby", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2020-11-19 17:00:14", last_sign_in_at: "2020-11-09 15:00:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "野村 三郎", profile: "2020年9月入社。リテールを中心に見習中です。", position: "セールス", image: nil, admin: false},
  {email: "shimada@test.com", encrypted_password: "$2a$12$ASGf3fp3p9RBdqnh8H.cb.9dprkYMDdeCuISwGAjS7bBltwNN.jAO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2020-11-19 17:00:56", last_sign_in_at: "2020-11-09 15:00:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "嶋田 四郎", profile: "嶋田指名のお客様がいらしたらいつでも取り次いでください！", position: "セールス", image: nil, admin: false},
  {email: "goto@test.com", encrypted_password: "$2a$12$D/pADcszbm/7X8TQex49vuEwa0Wv0GxB55ylmCuRLqMDyZWj5KHLC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2020-11-19 17:03:44", last_sign_in_at: "2020-11-09 15:00:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "後藤 悠", profile: "旅が趣味です", position: "セールスアシスタント", image: nil, admin: false},
  {email: "yamaguchi@test.com", encrypted_password: "$2a$12$f7bW.NCNTQGq8A8oSrgVnejDFtDaB44Y.kEEdRH9GZTyXqDw4EBBO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2020-11-20 04:45:21", last_sign_in_at: "2020-11-19 17:20:56", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "山口 洋子", profile: "システムサポート。不具合ありましたらお知らせください", position: "システム部", image: nil, admin: true},
  {email: "123@test.com", encrypted_password: "$2a$12$2Gg9P6YCh27BGhINm6yiGOKA/MwVbO.VujgDM6wtntBNxA5il0bsG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "esetsegsg", profile: nil, position: nil, image: nil, admin: false},
  {email: "1234@test.com", encrypted_password: "$2a$12$sz2if6X5FKUF3Cd3q3R9FOQZfj.FkRlHCP1aZZqy014FOuIC0hQna", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "テスト登録太郎", profile: nil, position: nil, image: nil, admin: false},
  {email: "wsesegegse@test.com", encrypted_password: "$2a$12$rh7Z2SGbWJd69.r6Q0aHxOb7H1/WIl7MCtbhTGF9jUro7ZHgN9mkK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "testsetsets", profile: nil, position: nil, image: nil, admin: false},
  {email: "segsegs@test.com", encrypted_password: "$2a$12$wCguXHQVuresf0jHuKl8YO.Vj3C3KGiidJ.YWs6SdidPPlK6AasE.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "asafsfaf", profile: nil, position: nil, image: nil, admin: false},
  {email: "egsg@test.com", encrypted_password: "$2a$12$aaVbO2qKd5wOIXH8NhkIAOycRg2HIb4BLXSeehk.AKBhnP4GHVKNK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "sふぁｓふぁｓふぁ", profile: nil, position: nil, image: nil, admin: false},
  {email: "test12@test.com", encrypted_password: "$2a$12$IhtZaelVRvQZ3Y0mdqgD9uv0uwqR//O4wSNvO6gQuw.hqbHOx0mqW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "test124", profile: nil, position: nil, image: nil, admin: false}
])
Project.create!([
  {name: "新規開拓プロジェクト", profile: "新規問い合わせ。顧客登録・取引実績なしのみ登録。", image: nil, creator: "久保田 太郎"},
  {name: "【既存顧客】お得意様応対", profile: "既存顧客のうち、年間売上が100万円以上のアカウント。", image: nil, creator: "山口 洋子"},
  {name: "販売代理店様提携プロジェクト", profile: "代理店の中村アド株式会社様を経由した問い合わせ対応。", image: nil, creator: "久保田 太郎"},
  {name: "【大型案件】△△県自治体振興プロジェクト", profile: "前期からの継続。関連問い合わせは本プロジェクトに統合します", image: nil, creator: "山口 洋子"},
  {name: "魚釣り", profile: "とても照っても", image: nil, creator: "久保田 太郎"}
])
ProjectUser.create!([
  {project_id: 1, user_id: 2},
  {project_id: 2, user_id: 1},
  {project_id: 3, user_id: 5},
  {project_id: 4, user_id: 2},
  {project_id: 1, user_id: 3},
  {project_id: 2, user_id: 4},
  {project_id: 2, user_id: 5},
  {project_id: 3, user_id: 2},
  {project_id: 3, user_id: 3},
  {project_id: 3, user_id: 4},
  {project_id: 4, user_id: 5},
  {project_id: 4, user_id: 4},
  {project_id: 1, user_id: 1},
  {project_id: 3, user_id: 1},
  {project_id: 5, user_id: 1},
  {project_id: 5, user_id: 3}
])
Message.create!([
  {content: "etst", project_id: 1, user_id: 1}
])
Role.create!([
  {name: "admin", resource_type: nil, resource_id: nil},
  {name: "operator", resource_type: nil, resource_id: nil}
])
Post.create!([
  {company_name: "ドドドドド", prefecture_id: "9", company_address: nil, company_url: "", contact_person: "田中", phone_number: "02-1111-1111", email: "gesets@test.com", leadstatus_id: "6", purchase_date: "2020-11-25 15:00:00", product_id: "3", add_file: nil, contact_reason: "tsetses", contact_des: "sfsgsgddgs", project_id: 1, user_id: 1},
  {company_name: "asasad", prefecture_id: "9", company_address: nil, company_url: "", contact_person: "吉田", phone_number: "01-1111-1111", email: "tesstest@test.com", leadstatus_id: "6", purchase_date: "2020-12-03 15:00:00", product_id: "3", add_file: nil, contact_reason: "asdasdaas", contact_des: "asasdas", project_id: 1, user_id: 1},
  {company_name: "awaffa", prefecture_id: "10", company_address: nil, company_url: "", contact_person: "河本", phone_number: "03-2222-2211", email: "31@test.com", leadstatus_id: "3", purchase_date: "2020-12-30 15:00:00", product_id: "2", add_file: nil, contact_reason: "sfsfsf", contact_des: "asfasfasfa", project_id: 1, user_id: 1},
  {company_name: "asfafasfsa", prefecture_id: "6", company_address: nil, company_url: "", contact_person: "平泉", phone_number: "33-3333-2222", email: "sasfaf@test.com", leadstatus_id: "4", purchase_date: "2020-11-25 15:00:00", product_id: "2", add_file: nil, contact_reason: "awfaa", contact_des: "faqwr", project_id: 1, user_id: 1},
  {company_name: "速修実践株式会社", prefecture_id: "14", company_address: nil, company_url: "", contact_person: "テスト", phone_number: "03-2234-5555", email: "testman@test.com", leadstatus_id: "6", purchase_date: "2020-11-26 15:00:00", product_id: "2", add_file: nil, contact_reason: "degegge", contact_des: "segs,ese,semg", project_id: 1, user_id: 1}
])
User::HABTM_Roles.create!([
  {user_id: 1, role_id: 1},
  {user_id: 2, role_id: 2},
  {user_id: 3, role_id: 2},
  {user_id: 4, role_id: 2},
  {user_id: 5, role_id: 2},
  {user_id: 6, role_id: 1},
  {user_id: 17, role_id: 2},
  {user_id: 18, role_id: 2},
  {user_id: 19, role_id: 2},
  {user_id: 20, role_id: 2},
  {user_id: 21, role_id: 2},
  {user_id: 22, role_id: 2}
])
Role::HABTM_Users.create!([
  {user_id: 1, role_id: 1},
  {user_id: 2, role_id: 2},
  {user_id: 3, role_id: 2},
  {user_id: 4, role_id: 2},
  {user_id: 5, role_id: 2},
  {user_id: 6, role_id: 1},
  {user_id: 17, role_id: 2},
  {user_id: 18, role_id: 2},
  {user_id: 19, role_id: 2},
  {user_id: 20, role_id: 2},
  {user_id: 21, role_id: 2},
  {user_id: 22, role_id: 2}
])
ActiveStorage::Blob.create!([
  {key: "v5isfk4nczalnjkd2btqafo5oz1c", filename: "user_sample3.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>154, "height"=>152, "analyzed"=>true}, byte_size: 9026, checksum: "qATk2/uGT41jkzI5EmRuNA=="},
  {key: "rkc7xj3fu298hlv9xnbc6w0x9ywy", filename: "09_F3_銀座.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>450, "height"=>567, "analyzed"=>true}, byte_size: 96740, checksum: "IiJck1/RQ4l3ocKV8xnvzA=="},
  {key: "6qxbb27dqmirz9fn0yl0y5729wfq", filename: "user_sample5.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>153, "height"=>153, "analyzed"=>true}, byte_size: 10417, checksum: "i3+KXW/CiU8opq96XLs01Q=="},
  {key: "0pyj5y919ts290z0lo9as8eaosna", filename: "99BC0FE4-3DAC-41D2-A436-D7AA4F039383_1_201_aのコピー.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>1073, "height"=>1084, "analyzed"=>true}, byte_size: 387746, checksum: "OzmzpCWziAynhy6dNQCogw=="},
  {key: "rebokqtbkbhbxwpx8twg60r62g48", filename: "img_04_01.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>183, "height"=>214, "analyzed"=>true}, byte_size: 12655, checksum: "qapPnvVqHyquwLvdaw/NEg=="},
  {key: "wpbz199pijlzeth9u73l3cga91n5", filename: "ngr231-jpp01090474.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>264, "height"=>335, "analyzed"=>true}, byte_size: 18303, checksum: "T4VjcZVpmyI8khOJYAsvuQ=="},
  {key: "jcareuubnv89nemdl68inmumpcuo", filename: "ngr231-jpp01090474.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>264, "height"=>335, "analyzed"=>true}, byte_size: 18303, checksum: "T4VjcZVpmyI8khOJYAsvuQ=="},
  {key: "whppunbf1u7jgap8233jgfyy1rbl", filename: "Gyazo-3.8.0.dmg", content_type: "application/x-apple-diskimage", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 3939799, checksum: "tErRTAsB5rAGJydkTWkEyQ=="},
  {key: "lqjhvphptg8wh3vggmds8zdgk82h", filename: "beef.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>800, "height"=>600, "analyzed"=>true}, byte_size: 182323, checksum: "KZaKWee2CV1N3k46tCygSg=="},
  {key: "k9v1ayee7ttxq531cd8iazkh6bty", filename: "beef.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>800, "height"=>600, "analyzed"=>true}, byte_size: 182323, checksum: "KZaKWee2CV1N3k46tCygSg=="},
  {key: "kupa0dplkgaxnr2avo131md3g09s", filename: "img_04_01.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>183, "height"=>214, "analyzed"=>true}, byte_size: 12655, checksum: "qapPnvVqHyquwLvdaw/NEg=="},
  {key: "ewmxm07wvyxgwylknp2c5iekp1ak", filename: "no-image.png", content_type: "image/png", metadata: {"identified"=>true, "width"=>400, "height"=>400, "analyzed"=>true}, byte_size: 9635, checksum: "UpgrKY+dhoYRhgu0gX2hmw=="},
  {key: "gtcevzejqad7ti9dhxygtisjbwux", filename: "G20090503Z00001980_view.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>283, "height"=>326, "analyzed"=>true}, byte_size: 16868, checksum: "9j+ly+SPeSyYH4lslxznbw=="},
  {key: "aypd5cjwwq1pljhpsi9oizys09b5", filename: "Jackson_Browne_1977.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>596, "height"=>683, "analyzed"=>true}, byte_size: 87758, checksum: "xWuXlVGR6mJL4GuRth57Jg=="},
  {key: "539vgsmf4o7qxg63jb2vzlv05o6o", filename: "ngr231-jpp01090474.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>264, "height"=>335, "analyzed"=>true}, byte_size: 18303, checksum: "T4VjcZVpmyI8khOJYAsvuQ=="},
  {key: "1orl3i8dututtordkuzio1kjdxo3", filename: "img_04_01.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>183, "height"=>214, "analyzed"=>true}, byte_size: 12655, checksum: "qapPnvVqHyquwLvdaw/NEg=="},
  {key: "p68gut93q43z61dumzwh18w54e89", filename: "no-image.png", content_type: "image/png", metadata: {"identified"=>true, "width"=>400, "height"=>400, "analyzed"=>true}, byte_size: 9635, checksum: "UpgrKY+dhoYRhgu0gX2hmw=="},
  {key: "0ksdb9ob9hhvcc9gvfnr05iutr5q", filename: "ngr231-jpp01090474.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>264, "height"=>335, "analyzed"=>true}, byte_size: 18303, checksum: "T4VjcZVpmyI8khOJYAsvuQ=="},
  {key: "uv6o1m1se2t5vkrx9p85z8eg1djc", filename: "user_sample2.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>165, "height"=>156, "analyzed"=>true}, byte_size: 10288, checksum: "QAwasH991MOI3eOHeSqgpQ=="},
  {key: "n5g6vpj3hk0ox3bdwf3hhlh1wr74", filename: "user_sample1.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>170, "height"=>160, "analyzed"=>true}, byte_size: 10239, checksum: "tBu+/Eo/6KVovk5OPvqfoQ=="},
  {key: "dfrctv6ioc87c9gv2ofahk8twclq", filename: "no-image-available.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>800, "height"=>800, "analyzed"=>true}, byte_size: 24193, checksum: "XZZMD2KLDBrMGgNYRTYplg=="},
  {key: "y1fwyijctd7rxiid9pswgc2h1hqn", filename: "user_sample3.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>154, "height"=>152, "analyzed"=>true}, byte_size: 9026, checksum: "qATk2/uGT41jkzI5EmRuNA=="},
  {key: "g2tcky5bimctdnw0ou63un3lkzs3", filename: "user_sample2.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>165, "height"=>156, "analyzed"=>true}, byte_size: 10288, checksum: "QAwasH991MOI3eOHeSqgpQ=="},
  {key: "mgqkl5gk5g6ihkvbmmmia1h4ghco", filename: "message.txt", content_type: "text/plain", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 4144, checksum: "d99qJRuygUkbi2PSy4ndrg=="},
  {key: "wqy4apxcou6n38e35kmzg75gmz8n", filename: "user_sample1.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "width"=>170, "height"=>160, "analyzed"=>true}, byte_size: 10239, checksum: "tBu+/Eo/6KVovk5OPvqfoQ=="}
])
ActiveStorage::Attachment.create!([
  {name: "avatar", record_type: "User", record_id: 3, blob_id: 3},
  {name: "avatar", record_type: "User", record_id: 4, blob_id: 5},
  {name: "avatar", record_type: "User", record_id: 5, blob_id: 6},
  {name: "avatar", record_type: "User", record_id: 6, blob_id: 7},
  {name: "avatar", record_type: "User", record_id: 7, blob_id: 8},
  {name: "avatar", record_type: "User", record_id: 8, blob_id: 9},
  {name: "avatar", record_type: "User", record_id: 9, blob_id: 10},
  {name: "avatar", record_type: "User", record_id: 10, blob_id: 11},
  {name: "avatar", record_type: "User", record_id: 11, blob_id: 12},
  {name: "avatar", record_type: "User", record_id: 12, blob_id: 13},
  {name: "avatar", record_type: "User", record_id: 13, blob_id: 14},
  {name: "avatar", record_type: "User", record_id: 14, blob_id: 15},
  {name: "avatar", record_type: "User", record_id: 15, blob_id: 16},
  {name: "avatar", record_type: "User", record_id: 17, blob_id: 18},
  {name: "avatar", record_type: "User", record_id: 18, blob_id: 19},
  {name: "avatar", record_type: "User", record_id: 19, blob_id: 20},
  {name: "avatar", record_type: "User", record_id: 20, blob_id: 24},
  {name: "avatar", record_type: "User", record_id: 21, blob_id: 25},
  {name: "avatar", record_type: "User", record_id: 2, blob_id: 36},
  {name: "avatar", record_type: "User", record_id: 1, blob_id: 38},
  {name: "avatar", record_type: "User", record_id: 22, blob_id: 39},
  {name: "post_files", record_type: "Post", record_id: 4, blob_id: 40},
  {name: "post_files", record_type: "Post", record_id: 5, blob_id: 41},
  {name: "post_files", record_type: "Post", record_id: 6, blob_id: 42},
  {name: "post_files", record_type: "Post", record_id: 6, blob_id: 43}
])
