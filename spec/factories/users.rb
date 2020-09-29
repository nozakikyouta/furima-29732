FactoryBot.define do
  factory :user do
    nickname              {"nozakikyouta"}
    email                 {"tukbhm@com"}
    password             {"a1a1a1"}
    password_confirmation   {"a1a1a1"}
    first_name            {"野崎"}
    last_name             {"喬太"}
    first_name_kana       {"ノザキ"}
    last_name_kana        {"キョウタ"}
    birthday              {"1998-12-10"}
  end
end