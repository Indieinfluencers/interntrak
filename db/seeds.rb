# Users

User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

# resources

Resource.create(
  title: "CSS Grid Garden",
  description: "Interactive garden to learn about CSS3 Grid Layout",
  url: "http://cssgridgarden.com",
)

Resource.create(
  title: "Flexbox Froggy",
  description: "Interactive game to learn about CSS3 Flexbox Layout",
  url: "http://flexboxfroggy.com",
)

Resource.create(
  title: "tryGit",
  description: "Interactive 25-part Git lesson",
  url: "https://try.github.io/levels/1/challenges/1",
)
