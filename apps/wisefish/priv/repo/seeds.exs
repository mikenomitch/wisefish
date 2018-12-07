# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

# === WIDGETS ===

# make_widget = fn _ ->
#   Wisefish.Core.create_widget(%{
#     title: Faker.Internet.domain_word(),
#     content: Faker.Lorem.Shakespeare.king_richard_iii()
#   })
# end

# Enum.each(0..100, make_widget)

# # === USERS ===

# make_user = fn _ ->
#   Wisefish.Accounts.create_user(%{
#     email: Faker.Internet.email(),
#     name: Faker.Name.name()
#   })
# end

# users = Enum.map(0..10, make_user)

# mike =
#   Wisefish.Accounts.create_user(%{
#     email: "mikenomitch@gmail.com",
#     name: "Mike Nomitch"
#   })

# === USER CREDENTIALS ===

# add credentials for user mike
# (and probably all users?)
