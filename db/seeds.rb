# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# user seed
User.create(name: "ゆうき", email: "q42ghj8cfr@gmail.com",
    password: "yukiyuki", password_confirmation: "yukiyuki")
User.create(name: "山田", email: "yamada@yamada.com",
    password: "yamadayamada", password_confirmation: "yamadayamada")
User.create(name: "たき", email: "taki@taki.com",
    password: "takitaki", password_confirmation: "takitaki")


# medicine seeds
me_names = %w(アレグラ コルゲンコーワ クリアミン配合錠
レスタミンコーワクリーム チアトンカプセル)
me_effects = %w(鼻炎用内服薬 解熱鎮痛 解熱鎮痛 抗ヒスタミン薬 消化器官改善)
for i in 0..4 do
  Medicine.create(name: me_names[i], effect: me_effects[i])
end

# institution seeds
in_names = %w(藏本内科クリニック 芝大門クリニック ながさき内科医院)
in_address = %w(港区芝公園１－７－１５ 港区芝大門１－１６－１０ 港区浜松町２－３－１)
in_contacts = %w(03-5733-3355 03-6435-6930 03-3435-5707)
for i in 0..2 do
  Institution.create(name: in_names[i], address: in_address[i], contact: in_contacts[i])
end

# pharmacsit seeds
ph_names = %w(高橋海斗 河原翔平 青木舞 塚本裕子)
ph_inid = [1, 3, 2, 2]
for i in 0..3 do
  Pharmacist.create(name: ph_names[i], institution_id: ph_inid[i])
end

# medicine_history seeds
me_date = %w(20190427 20150309 20171110)
me_uid = [1, 2, 3]
me_pid = [2, 1, 4]
me_mid = [4, 1, 2]
me_dose = %w(3mg 5錠 5mg)
me_adm = %w(食前 食前 食後)
for i in 0..2 do
  MedicineHistory.create(date: me_date[i], user_id: me_uid[i],
  pharmacist_id: me_pid[i], medicine_id: me_mid[i],
  dose: me_dose[i], adm: me_adm[i])
end