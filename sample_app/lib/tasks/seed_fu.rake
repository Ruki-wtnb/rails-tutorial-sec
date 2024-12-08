# frozen_string_literal: true

namespace :db do
  desc 'Load seed-fu fixtures'
  task seed_fu: :environment do
    puts 'Loading seed-fu fixtures...'
    SeedFu.seed(Rails.root.join('db', 'fixtures'))
    puts 'Seed-fu fixtures loaded successfully!'
  end
end
