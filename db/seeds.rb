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
me_names = %w(マヴィレット リリカ アバスチン オプジーボ オキナゾール ネキシウム
  ゾフルーザ アジルバ アクチビア軟膏 タケキャブ ロキソニン ニコチネル
  サムスカ メマリー アラセナ ガスター10)
me_kind = [0,0,1,0,4,0,1,0,4,0,2,9,0,0,4,3]
me_effects = %w(C型肝炎 神経障害性疼痛 抗がん剤 抗がん剤 皮膚感染症 消化性潰瘍
  インフルエンザ 高血圧 口唇ヘルペス 消化性潰瘍 鎮痛剤 禁煙 利尿薬 認知症 抗ウイルス剤 胃腸薬)
me_text = %w(
  C型慢性肝炎又はC型代償性肝硬変におけるウイルス血症の改善が期待されます。C型慢性肝炎又はC型代償性肝硬変におけるウイルス血症の改善が期待されます。  
  中枢神経系においてカルシウム流入を抑制し、グルタミン酸などの興奮性神経伝達物質の遊離を抑制することにより、過剰に興奮した神経を鎮め、痛みを和らげます。
  通常、神経障害性疼痛や線維筋痛症に伴う疼痛の治療に用いられます。
  オプジーボ（一般名：ニボルマブ（遺伝子組換え））は、ヒトPD-1に対するヒト型IgG4モノクローナル抗体です。オプジーボは、PD-1とPD-1リガンド（PD-L1およびPD-L2）との結合を阻害することで、がん細胞により不応答となっていた抗原特異的T細胞を回復・活性化させ、抗腫瘍効果を示します。
  カンジダ菌の細胞膜に対する殺菌作用および発育を阻止することにより、炎症やかゆみを抑えます。通常、皮膚真菌症〔白癬、カンジダ症、癜風（いわゆる水虫、たむしなど）〕の治療に用いられます。
  胃酸分泌の最終過程であるプロトンポンプに作用し、胃酸分泌を抑制します。また、胃酸分泌を抑制し胃内のpHを上昇させることにより、抗菌薬の抗菌作用を高めます。
  インフルエンザウイルスが細胞内で増殖するのを抑制することで、インフルエンザの症状を緩和します。通常、A型またはB型インフルエンザウイルス感染症の治療に用いられます。
  血管を収縮して血圧を上げる体内の物質であるアンジオテンシンIIの受容体に拮抗し、末梢血管の抵抗を低下させて血圧を下げる薬です。通常、高血圧症の治療に用いられます。
  抗ウイルス成分アシクロビルを含有する口唇ヘルペスの再発治療薬です。アシクロビルは口唇ヘルペスを起こすウイルスに直接作用し、症状を改善します。口唇ヘルペスは、ヘルペスウイルスの感染が原因で発症します。
  カリウムイオンに競合的な様式でプロトンポンプを阻害することによって、胃酸の生成を抑制します。通常、胃・十二指腸潰瘍、逆流性食道炎の治療、低用量アスピリン・非ステロイド性抗炎症薬服用時における胃・十二指腸潰瘍の再発抑制に用いられます。
  炎症を引きおこすプロスタグランジンの生合成を抑え、炎症に伴う腫れや痛みをやわらげ、熱を下げます。通常、関節リウマチ・変形性関節症ほか手術後や外傷後並びに抜歯後などの鎮痛・消炎、急性上気道炎の解熱・鎮痛に用いられます。
  皮膚から徐々にニコチンを吸収させて、禁煙時に生じるタバコを吸いたいという欲求、いらいら感、集中力低下などの症状をやわらげ、無理なく禁煙に導きます。
  この薬は腎臓に作用して尿量を増やし、体内の余分な水分を排泄することにより、体のむくみをとります。通常、他の利尿剤で治療しても体のむくみに対する効果が不十分な場合に、他の利尿剤に併用して用いられます。
  脳内グルタミン酸受容体サブタイプのNMDA受容体チャネルの過剰な活性化を抑制することにより細胞内への過剰なカルシウムイオンの流入を抑制し、神経細胞傷害や記憶・学習障害を抑制します。通常、中等度および高度アルツハイマー型認知症における認知症症状の進行抑制に用いられます。
  病気の原因であるウイルスの増殖を抑制し、皮膚症状を改善します。通常、帯状疱疹、単純疱疹の治療に使用されます。
  胃粘膜のヒスタミン2受容体を遮断し、胃酸分泌をおさえます。通常、胃・十二指腸などの潰瘍や胃炎、食道炎などの治療に用いられます。
  )

for i in 0..15 do
  Medicine.create(name: me_names[i], kind: me_kind[i], effect: me_effects[i], description: me_text[i])
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
me_date = %w(2019-04-27 2015-03-09 2017-11-10)
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