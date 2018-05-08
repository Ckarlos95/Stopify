require "../config/application.cr"

# mexico = Country.new
# mexico.name = "México"
# if mexico.save
#   puts "Country saved"
# end

# carlos = User.new
# carlos.email = "ckarlos_95@hotmail.es"
# carlos.password = "abcd1234"
# carlos.name = "Carlos Aguilera"
# carlos.birthday = Time.new 1995, 10, 2
# carlos.gender = 1
# carlos.role = 1
# mex = Country.find_by :name, "Mexico"
#
# if mex
#   puts "México found! :)"
#   carlos.country = mex
# else
#   puts "México not found :("
# end
#
# if carlos.save
#   puts "User saved"
# else
#   puts "Could not save user!"
# end

p = Playlist.new
p.name = "tugfa"
c = User.find_by :email, "ckarlos_95@hotmail.es"
if c
  puts "User found! :)"
  p.user = c
else
  puts "User not found :("
end

if p.save
  puts "Playlist saved!"
else
  puts "Could not save playlist"
end

if c = User.find_by :email, "ckarlos_95@hotmail.es"
  pp c.created_playlists
end
