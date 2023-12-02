# ジョカツ川柳
※ mainブランチがバージョンアップ前（2023/12/01）

## 開発環境
- Ruby：3.1.4
- Rails：6.1.7.2
- DB:
  - 本番: PostgreSQL
  - 開発: SQLite

## デプロイ手順
1. Herokuにログインする
2. heroku login
3. heroku create jokatsu-senryu
4. git push heroku heroku:main
5. heroku run rails db:migrate
6. heroku run rails db:seed RAILS_ENV=production
7. Herokuコンソールで環境変数を設定する

## データベースリセット
1. heroku pg:reset -a jokatsu-senryu
2. heroku run rails db:migrate db:seed RAILS_ENV=production

## TablePlusの設定
1. HerokuのResourceからPostgres画面へ遷移
2. Postgres画面のSettingからDatabase Credentialsを開き、各値をTablePlusに設定する
