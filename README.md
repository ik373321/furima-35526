users テーブル  ユーザー情報
  
| Column          | Type   | Options     |
| --------------  | -----  | ------------|
| nickname        | string | null: false | ニックネーム
| email           | string | null: false | メールアドレス
| password        | string | null: false | パスワード
| last_name       | string | null: false | 姓
| first_name	    | string | null: false | 名
| last_name_kana  | string | null: false | 姓カナ
| first_name_kana	| string | null: false | 名カナ
| birthday        | date   | null: false | 生年月日



### Association

products　テーブル 商品情報
| Column      | Type   | Options     |
| ----------  | -----  | ------------|
| name        | string | null: false | 商品名
| details     | text   | null: false | 商品説明
| category    | string | null: false | カテゴリー
| condition   | string | null: false | 商品の状態


customers　テーブル　配送先情報
| Column         | Type   | Options     |
| -------------  | ------ | ------------|
| ShipMethod     | string | null: false | 配送料負担
| PostalCode     | string | null: false | 郵便番号
| prefecture_id  | int    | null: false | 県
| city           | string | null: false | 市区町村
| block          | string | null: false | 番地
| building       | string |             | 建物名
| mobile         | string | null: false | 電話番号
| timeout        | string | null: false | 発送までの日時


records　テーブル

| Column  | Type       | Options                        |
| ------- | --------   |--------------------------------|
| user    | references | null: false, foreign_key: true |誰が買うか
| name    | references | null: false, foreign_key: true |商品名