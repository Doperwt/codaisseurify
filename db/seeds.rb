# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
artist1 = Artist.create!(name:"Alt-j",bio:"")
artist2 = Artist.create!(name:"Cake",bio:"")
artist3 = Artist.create!(name:"The Prodigy",bio:"")
artist4 = Artist.create!(name:"Wolfmother",bio:"")

Song.create!([
  {name:"Breezeblocks",description:"fun song",duration:210,artist:artist1},
  {name:"Mathilda",description:"great song",duration:180,artist:artist1},
  {name:"The distance",description:"shit song",duration:170,artist:artist2},
  {name:"Omen",description:"war song",duration:190,artist:artist3},
  {name:"Wild frontier",description:"war song",duration:190,artist:artist3},
  {name:"Joker and the Thief",description:"war song",duration:230,artist:artist4},
  {name:"Woman",description:"war song",duration:190,artist:artist4},
  ])
