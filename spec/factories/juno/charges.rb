# frozen_string_literal: true

FactoryBot.define do
  factory :juno_charge, class: 'Juno::Charge' do
    amount { Faker::Commerce.price(range: 40..100) }
    billet_url { Faker::Internet.url(host: 'pay.juno.com') }
    code { Faker::Number.number(digits: 20) }
    key { "chr_#{Faker::Lorem.characters(number: 20)}" }
    sequence(:number) { |n| n }
    status { 'ACTIVE' }
    order
  end
end
