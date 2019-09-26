# お薬手帳Web
## 要件を決める
- ユースケース図
  - どういうユーザがいて、それぞれがどういう使い方をするか
  - http://plantuml.com/ja/use-case-diagram
## 設計
- データモデル設計
- 画面設計
## 実装
## リリース
- heroku
## 披露

### ユースケース記述
- 患者
  - ログインする
  - お薬手帳を見る
  - お薬手帳を薬剤師にみせる（提出する）
  - 市販薬やサプリメントを記入する
  - プロフィールを登録、編集する
  - アレルギーの有無を登録、編集する
  - 健康診断、血液検査の結果などを登録、編集する
  - 既往症を登録、編集する
  - 疑問・質問などを記入・編集する

- 薬剤師/医者
  - 患者のお薬手帳を参照する
  - 処方した薬をお薬と注意事項を手帳に追加する
  - 副作用歴を登録、編集する
  - 健康診断、血液検査の結果などを登録、編集する
  - 医院・薬局の登録、編集をする


### ユースケース図(UML)

上のユースケースをもとにユースケース図を作成
```uml
@startuml
left to right direction
' システム境界にpackageを四角で記述
skinparam packageStyle rectangle

actor 患者 as PA
actor 薬剤師 as PH

rectangle お薬手帳の利用 {
  usecase (ログインする) as login
  usecase (お薬手帳をみる) as look
  usecase (薬を記入する) as add_me
  usecase (プロフィール登録をする) as add_pr
  usecase (アレルギーの登録をする) as add_al
  usecase (既往症の登録をする) as add_mh
  usecase (副作用の登録をする) as add_se
  usecase (医院・薬局の登録をする) as add_ho
  usecase (お薬手帳をみる) as look
  usecase (健康診断、血液検査の結果を登録する) as checkup
}
PA -- login
PA -- look
PA -- add_me
PA -- add_pr

PH -- look
PH -- add_me
PH -- add_se
PH -- add_ho

add_pr ..> add_al:<<include>>
add_pr ..> add_mh:<<include>>
add_pr ..> checkup:<<include>>

@enduml
```

### データモデル
<details>
<summary>薬歴(MedicineHistory)</summary>

- 薬歴ID
- 処方日(date):string
- 患者ID(user_id):references
- 薬剤師ID(pharmacist_id):references
- 薬ID(medicine_id):references
- 用量(dose):string
- 要法（食前・食後など）(adm):string
</details>

<details>
<summary>患者(user)</summary>

- 患者ID
- 名前(name):string
- メール(email):string
- PW(password):string
</details>

<details>
<summary>追加情報(profile)</summary>

- 患者ID (user_id):references
- 性別(sex):integer
- 生年月日(birthday):integer
- 身長(height):float
- 体重(weight):float
- 血液型(blood):string
- 住所(address):string
- 連絡先(contact):string
</details>

<details>
<summary>薬剤師(pharmacist)</summary>

- 薬剤師ID
- 名前(name):string
- 医療機関ID(institution_id):references
</details>

<details>
<summary>医療機関(institution)</summary>

- 医療機関ID
- 機関名(name):string
- 住所(address):string
- 電話番号(contact):string
</details>

<details>
<summary>薬(medicine)</summary>

- 薬ID
- 名前(name):string
- 効果(effect):string
</details>
<details>
<summary>アレルギー情報</summary>

- アレルギーID
- アレルギー名
- 患者ID
- 食べ物or薬
    - 薬ID
    - 食べ物
</details>

<details>
<summary>副作用歴</summary>

- 副作用ID
- 日付
- 患者ID
- 薬ID
- 症状
</details>

<details>
<summary>既往歴</summary>

- 既往歴ID
- 日付
- 患者ID
- 疾患
</details>

### ER図
データモデルを参考にER図を作成していく
```uml
' 図の中で目立たせたいエンティティに着色するための色の名前（定数）を定義します。
!define MAIN_ENTITY #E2EFDA-C6E0B4
!define MAIN_ENTITY_2 #FCE4D6-F8CBAD

' 他の色も、用途が分りやすいように名前をつけます。
!define METAL #F2F2F2-D9D9D9
!define MASTER_MARK_COLOR AAFFAA
!define TRANSACTION_MARK_COLOR FFAA00

/'
  デフォルトのスタイルを設定します。
  この場合の指定は class です。entity ではエラーになります。
'/
skinparam class {
    BackgroundColor METAL
    BorderColor Black
    ArrowColor Black
}

package "お薬手帳システム" as medi_sys {
    entity "患者テーブル" as patient <<E, TRANSACTION_MARK_COLOR>> MAIN_ENTITY {
        +患者ID
        --
        名前
        性別
        生年月日
        身長
        体重
        血液型
        住所
        連絡先
    }

    entity "薬歴テーブル" as medicine_history <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
        + 薬歴ID
        --
        # 患者ID
        # 薬剤師ID
        # 薬ID
        処方日
        用量
        要法（食前・食後など）
    }
    
    entity "薬テーブル" as medicine <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
        + 薬ID
        --
        名前
        効果
    }
    
    entity "薬剤師テーブル" as pharmacist <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
        + 薬剤師ID
        --
        名前
        # 医療機関ID 
    }
    
    entity "医療機関テーブル" as hospital <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
    + 医療機関ID
    --
    機関名
    住所
    電話番号
    }

    entity "アレルギーテーブル" as allergies <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
    + アレルギーID
    --
    アレルギー名
    # 患者ID
    # 食べ物or薬(薬ならば薬ID)
    }
    
    entity "副作用歴テーブル" as side_effect <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
    + 副作用ID
    --
    日付
    # 患者ID
    # 薬ID
    症状
    }
    
    entity "既往歴テーブル" as sick_history <<E,TRANSACTION_MARK_COLOR>> MAIN_ENTITY_2 {
    + 既往歴ID
    --
    日付
    # 患者ID
    疾患名
    }
}

medicine_history }o---- patient 
medicine_history }o---- pharmacist
medicine_history }o---- medicine
pharmacist }o---- hospital
allergies }o--ri-- patient
allergies }o---- medicine
side_effect }o---- patient
side_effect }o----medicine
patient --ri--o{ sick_history
```