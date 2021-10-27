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
  name  = "wip#{n+1}"
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
  name  = "株式会社a#{n+1}"
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
  name  = "株式会社b#{n+1}"
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
  name  = "株式会社c#{n+1}"
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
60.times do |n|
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


# 投稿川柳(女性パワーで未来を変えるの部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "女性パワーで未来を変えるの部"
  user_id = n+2
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成1"

# 投稿川柳(ジェンダー・多様性の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "ジェンダー・多様性の部"
  user_id = n+7
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成2"

# 投稿川柳(はたらく女子の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "はたらく女子の部"
  user_id = n+12
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成3"

# 投稿川柳(ママ・子どもの部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "ママ・子どもの部"
  user_id = n+17
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成4"

# 投稿川柳(名もなき家事の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "名もなき家事の部"
  user_id = n+22
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成5"

# 投稿川柳(本当にありがとう❣感謝の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "本当にありがとう❣感謝の部"
  user_id = n+27
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成6"

# 投稿川柳(あるある❣の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "あるある❣の部"
  user_id = n+32
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成7"

# 投稿川柳(涙がポロ❣の部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "涙がポロ❣の部"
  user_id = n+37
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成8"

# 投稿川柳(輝け❣私のライフスタイルの部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "輝け❣私のライフスタイルの部"
  user_id = n+42
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成9"

# 投稿川柳(心がきゅん❣私の癒しの部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "心がきゅん❣私の癒しの部"
  user_id = n+47
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成10"

# 投稿川柳(SDGsアクションの部)
5.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "SDGsアクションの部"
  user_id = n+52
  Post.create!(
    first_phrase: first_phrase,
    second_phrase: second_phrase,
    third_phrase: third_phrase,
    pen_name: pen_name,
    category: category,
    user_id: user_id
  )
end
puts "投稿川柳作成11"