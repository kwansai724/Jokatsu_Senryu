# 開発環境用
Voter.create!(
  name: "管理者",
  email: "admin@email.com",
  group: "administrator",
  admin: true,
  password: "password",
  password_confirmation: "password",
)

puts "管理者アカウント作成"
