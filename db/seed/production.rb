# 本番環境用

# 管理者（WIP)
Staff.create!(
  login_id: "1234567w",
  admin: true,
  group_name: "WIP",
  password: "password",
  password_confirmation: "password"
)
puts "管理者（WIP)アカウント作成"

# 管理者（株式会社A)
Staff.create!(
  login_id: "1234567a",
  admin: false,
  group_name: "株式会社A",
  password: "password",
  password_confirmation: "password"
)
puts "管理者（株式会社A)アカウント作成"

# 管理者（株式会社B)
Staff.create!(
  login_id: "1234567b",
  admin: false,
  group_name: "株式会社B",
  password: "password",
  password_confirmation: "password"
)
puts "管理者（株式会社B)アカウント作成"

# 管理者（株式会社C)
Staff.create!(
  login_id: "1234567c",
  admin: false,
  group_name: "株式会社C",
  password: "password",
  password_confirmation: "password"
)
puts "管理者（株式会社C)アカウント作成"
