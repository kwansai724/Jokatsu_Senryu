# 開発環境用

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

# 管理者（株式会社D)
Staff.create!(
  login_id: "1234567d",
  admin: false,
  group_name: "株式会社D",
  password: "password",
  password_confirmation: "password"
)
puts "管理者（株式会社D)アカウント作成"


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
4450.times do |n|
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "女性パワーで未来を変えるの部"
  user_id = n+1
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "ジェンダー・多様性の部"
  user_id = n+401
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "はたらく女子の部"
  user_id = n+801
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "ママ・子どもの部"
  user_id = n+1201
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "名もなき家事の部"
  user_id = n+1601
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "本当にありがとう❣️感謝の部"
  user_id = n+2001
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "あるある❣️の部"
  user_id = n+2401
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "涙がポロ❣️の部"
  user_id = n+2801
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "輝け❣️私のライフスタイルの部"
  user_id = n+3201
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "心がきゅん❣️私の癒しの部"
  user_id = n+3601
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
400.times do |n|
  first_phrase = Faker::Lorem.word
  second_phrase = Faker::Lorem.word
  third_phrase = Faker::Lorem.word
  pen_name = Faker::Name.name
  category = "SDGsアクションの部"
  user_id = n+4001
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