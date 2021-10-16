# 開発環境用

# 管理者
Voter.create!(
  name: "管理者",
  email: "admin@email.com",
  group: "administrator",
  admin: true,
  password: "password",
  password_confirmation: "password"
)
puts "管理者アカウント作成"


# 投票者(WIP)
5.times do |n|
  name  = Faker::Name.name
  email = "voter-#{n+1}@email.com"
  group = "WIP"
  favorite_post = Faker::Number.between(from: 1, to: 5000)
  reason = Faker::Lorem.sentence
  admin = "false"
  password = "password"
  Voter.create!(
    name: name,
    email: email,
    group: group,
    favorite_post: favorite_post,
    reason: reason,
    admin: admin,
    password: password,
    password_confirmation: password
  )
end
puts "投票者(WIP)作成"


# 投票者(株式会社A)
5.times do |n|
  name  = Faker::Name.name
  email = "voter-#{n+6}@email.com"
  group = "株式会社A"
  favorite_post = Faker::Number.between(from: 1, to: 5000)
  reason = Faker::Lorem.sentence
  admin = "false"
  password = "password"
  Voter.create!(
    name: name,
    email: email,
    group: group,
    favorite_post: favorite_post,
    reason: reason,
    admin: admin,
    password: password,
    password_confirmation: password
  )
end
puts "投票者(株式会社A)作成"


# 投票者(株式会社B)
5.times do |n|
  name  = Faker::Name.name
  email = "voter-#{n+11}@email.com"
  group = "株式会社B"
  favorite_post = Faker::Number.between(from: 1, to: 5000)
  reason = Faker::Lorem.sentence
  admin = "false"
  password = "password"
  Voter.create!(
    name: name,
    email: email,
    group: group,
    favorite_post: favorite_post,
    reason: reason,
    admin: admin,
    password: password,
    password_confirmation: password
  )
end
puts "投票者(株式会社B)作成"


# 投票者(株式会社C)
5.times do |n|
  name  = Faker::Name.name
  email = "voter-#{n+16}@email.com"
  group = "株式会社C"
  favorite_post = Faker::Number.between(from: 1, to: 5000)
  reason = Faker::Lorem.sentence
  admin = "false"
  password = "password"
  Voter.create!(
    name: name,
    email: email,
    group: group,
    favorite_post: favorite_post,
    reason: reason,
    admin: admin,
    password: password,
    password_confirmation: password
  )
end
puts "投票者(株式会社C)作成"


# 投稿者
35.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  gender = Faker::Gender.binary_type
  address = Faker::Address.city
  profession = Faker::Job.title
  age = Faker::Number.number(digits: 2)
  note = Faker::Lorem.sentence
  questionary = Faker::Lorem.sentence
  User.create!(
    name: name,
    email: email,
    gender: gender,
    address: address,
    profession: profession,
    age: age,
    note: note,
    questionary: questionary
  )
end
puts "投稿者作成"
