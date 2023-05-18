FactoryBot.define do
  factory :post do
    title { 'How to test a controller properly' }
    text { 'To test a controller properly, you should...' }
    author { FactoryBot.create(:user) }
    comment_counter { 0 }
    like_counter { 0 }
  end
end
