# 開発環境用

# 管理者
Voter.create!(
  name: "管理者",
  email: "admin@email.com",
  group: "administrator",
  admin: true,
  password: "password",
  password_confirmation: "password",
)

puts "管理者アカウント作成"

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
    questionary: questionary,
  )
end

puts "投稿者作成"
