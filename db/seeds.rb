# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Photo.destroy_all
Artist.destroy_all
artist1 = Artist.create!(name:"Alt-j",bio:"New band ")
artist2 = Artist.create!(name:"Cake",bio:"Older band")
artist3 = Artist.create!(name:"The Prodigy",bio:"fecking australians")
artist4 = Artist.create!(name:"Wolfmother",bio:"Oldest band")

Song.create!([
  {name:"Breezeblocks",duration:210,artist:artist1},
  {name:"Mathilda",duration:180,artist:artist1},
  {name:"The distance",duration:170,artist:artist2},
  {name:"Omen",duration:190,artist:artist3},
  {name:"Wild frontier",duration:190,artist:artist3},
  {name:"Joker and the Thief",duration:230,artist:artist4},
  {name:"Woman",duration:190,artist:artist4},
  ])
Photo.create!([
  {artist:artist1,remote_image_url:"https://images-na.ssl-images-amazon.com/images/I/E1EJLYqV+hS._CR0,0,3840,2880_._SL1000_.png"},
  {artist:artist2,remote_image_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/WWDC09-Cake-15_%284694802725%29.jpg/1200px-WWDC09-Cake-15_%284694802725%29.jpg"},
  {artist:artist3,remote_image_url:"https://pbs.twimg.com/media/DQ65fMRWkAECPMQ.jpg"},
  {artist:artist4, remote_image_url:"http://www.wolfmother.com/files/2015/11/victorious-500.jpg"},
  ])
