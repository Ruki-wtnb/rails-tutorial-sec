# frozen_string_literal: true

# bundle exec rake ridgepole:reset
# bundle exec rake ridgepole:apply
# bundle exec rake db:seed_fu

namespace :ridgepole do
  desc 'ridgepole --apply && annotate'
  task :apply do
    Rake::Task['ridgepole:apply-only'].invoke
    Rake::Task['db:schema:dump'].invoke
    Rake::Task['annotate_models'].invoke
    Rake::Task['ridgepole:routes'].invoke
  end

  desc 'rake db:drop && rake db:create && rake db:schema:load'
  task :reset do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:schema:load'].invoke
  end

  desc 'ridgepole --apply'
  task :'apply-only' do
    sh "ridgepole --env #{ENV.fetch('RAILS_ENV',
                                    'development')}  -c config/database.yml -f db/Schemafile drop-tabel --apply"
  end

  desc 'ridgepole --apply --dry-run'
  task :'dry-run' do
    sh "ridgepole --env #{ENV.fetch('RAILS_ENV',
                                    'development')}  -c config/database.yml -f db/Schemafile drop-tabel --apply --dry-run"
  end

  desc 'ridgepole --diff'
  task :diff do
    sh "ridgepole --env #{ENV.fetch('RAILS_ENV',
                                    'development')}  --diff config/database.yml -f db/Schemafile drop-tabel"
  end

  desc 'ridgepole --export'
  task :export do
    sh "ridgepole --env #{ENV.fetch('RAILS_ENV', 'development')}  -c config/database.yml --export -o db/Schemafile"
  end

  desc 'Annotate routes'
  task routes: :environment do
    routes = `rails routes`
    File.open('config/routes.rb', 'r+') do |file|
      lines = file.each_line.reject { |line| line =~ /^#==/ }.join
      file.rewind
      file.puts "#== Routes\n# #{routes.gsub("\n", "\n# ")}"
      file.puts lines
    end
  end
end
