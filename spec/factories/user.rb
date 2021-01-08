FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@example' }
    password               { '123456a' }
    password_confirmation  { password }
    first_name             { '宮崎' }
    last_name              { '寿希也' }
    first_name_ruby        { 'ミヤザキ' }
    last_name_ruby         { 'ジュキヤ' }
    birth_date             { '1995-02-22' }
  end
end
