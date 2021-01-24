FactoryBot.define do
  factory :home_object do
    postal_code       { '123-1234' } # 郵便番号
    prefecture_id     { 2 } # 都道府県
    municipalities    { '横浜市緑区' } # 市町村
    address           { '青山1-1-1' } # 番地
    phone_number      { '12312341234' } # 電話番号
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
