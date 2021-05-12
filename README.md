users テーブル  ユーザー情報
  
| Column             | Type   | Options                  |
| ------------------ | -----  | -------------------------|
| nickname           | string | null: false              | ニックネーム
| email              | string | unique:true, null: false | メールアドレス
| encrypted_password | string | null: false              | パスワード
| last_name          | string | null: false              | 姓
| first_name	       | string | null: false              | 名
| last_name_kana     | string | null: false              | 姓カナ
| first_name_kana	   | string | null: false              | 名カナ
| birthday           | date   | null: false              | 生年月日

### Association
- has_many :products
- has_many :records

products　テーブル 商品情報
| Column         | Type       | Options                        |
| -------------  | ---------- | ------------------------------ |
| name           | string     | null: false                    | 商品名
| details        | text       | null: false                    | 商品説明
| category_id    | integer    | null: false                    | カテゴリー
| condition_id   | integer    | null: false                    | 商品の状態   
| ship_method_id | integer    | null: false                    | 配送料負担         配送について
| prefecture_id  | integer    | null: false                    | 配送元の地域
| timeout_id     | integer    | null: false                    | 発送までの日数
| price          | integer    | null: false                    | 価格
| user           | references | null: false, foreign_key: true |
### Association　
- has_one :record
- belongs_to :user




customers　テーブル　配送先情報
| Column         | Type       | Options                        |
| -------------  | ---------  | -------------------------------|
| postal_code    | string     | null: false                    | 郵便番号
| prefecture_id  | integer    | null: false                    | 県
| city           | string     | null: false                    | 市区町村
| block          | string     | null: false                    | 番地
| building       | string     |                                | 建物名
| mobile         | string     | null: false                    | 電話番号
| record         | references | null: false, foreign_key: true |


### Association
- belongs_to :records





records　テーブル

| Column  | Type       | Options                        |
| ------- | --------   |--------------------------------|
| user    | references | null: false, foreign_key: true |誰が買うか
| product | references | null: false, foreign_key: true |商品名

### Association
- belongs_to :user
- belongs_to :product
- has_one :customer
