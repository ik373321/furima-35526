FactoryBot.define do
  factory :user do
    nickname              {'furima山田'}
    email                 {'yamada@yamada'}
    password              {'1234asdf'}
    password_confirmation {password}

    last_name{"山田"}
    first_name{"太郎"}
    last_name_kana{"ヤマダ"}
    first_name_kana{"タロウ"}
    birthday{"1930-02-23"}
  end
end
