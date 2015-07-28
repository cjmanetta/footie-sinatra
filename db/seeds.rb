
10.times do
  User.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    birthdate: Faker::Date.backward(1000),
    email: Faker::Internet.email,
    password: "1234")
end

User.create(
  admin: true,
  firstname: "Charlotte",
  lastname: "Manetta",
  birthdate: Date.parse('1984-11-24'),
  username:"cjmanetta",
  password: "1234")

User.create(
  admin: true,
  firstname: "Dena",
  lastname: "Delaviz",
  birthdate: Date.parse('1985-06-02'),
  username:"ddelaviz",
  password: "1234")

activity_array = ["Challenge", "Game", "Practice"]

5.times do
  Activity.create(
    title: Faker::Lorem.words(2).join(' '),
    description: Faker::Lorem.sentence,
    date: Faker::Date.forward(60),
    activity_type: activity_array.sample)
end

players = User.where("admin = false")

players.each do |player|
  5.times do
    Score.create(
      value: rand(0..5),
      user_id: player.id,
      activity_id: rand(1..5))
  end
end