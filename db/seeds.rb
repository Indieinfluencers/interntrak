# Users

User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

# Resources

css_grid_garden = Resource.create!(
  title: "CSS Grid Garden",
  description: "Interactive garden to learn about CSS3 Grid Layout",
  url: "http://cssgridgarden.com",
)

flexbox_froggy = Resource.create!(
  title: "Flexbox Froggy",
  description: "Interactive game to learn about CSS3 Flexbox Layout",
  url: "http://flexboxfroggy.com",
)

try_git = Resource.create!(
  title: "tryGit",
  description: "Interactive 25-part Git lesson",
  url: "https://try.github.io/levels/1/challenges/1",
)

# Topics

Topic.create!(
  title: "CSS",
  description: "Styling for HTML webpages",
  resources: [css_grid_garden, flexbox_froggy],
)

Topic.create!(
  title: "Git",
  description: "Cooperative coding",
  resources: [try_git],
)

# types

Type.create!(
  title: "Game",
  resources: [css_grid_garden, flexbox_froggy],
)

Type.create!(
  title: "Tutorial",
  resources: [try_git, css_grid_garden, flexbox_froggy],
)
