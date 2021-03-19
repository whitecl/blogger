FactoryBot.define do
  factory :post do
    author factory: :user
    title { 'the title' }
    body { 'the body' }
  end
end
