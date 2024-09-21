# system specを実行できるRails実行環境

1. .devcontainer でコンテナを作成
2. Gemfileを外のディレクトリへコピー
3. bundle install
4. rails generate
5. bin/rails generate rspec:install
6. bundle exec rspec spec/ で動作確認
7. bundle exec spring binstub rspec
8. spec/ にsupportディレクトリを移動させる
9. /Users/ruki-wtnb/Code/rspec-study/ruby-on-rails-devcontainer/rspec-test/config/environments/development.rb に
　　config.hosts << "www.example.com"　を追記する
