# ジョカツ川柳

## 開発環境
- Ruby: 3.1.4
- Rails: 6.1.7.2
- DB: SQLite

## 本番環境
EC2にMySQL、NGINX、Ruby、Railsをインストール<br>
お名前.comで登録したドメインを使ってHTTPS化<br>
Codebuildでデプロイ
- EC2（Amazon Linux2）
- RDS(MySQL)
- ALB
- Route53
- Certificate Manager
- Codebuild
- System manager
