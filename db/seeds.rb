# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
fincher = Director.create(name: "David Fincher")
fincher.movies << Movie.create(title: "Se7en", year: "1995", description: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.", owned: true)
fincher.movies << Movie.create(title: "The Game", year: "1997", description: "After a wealthy banker is given an opportunity to participate in a mysterious game, his life is turned upside down when he becomes unable to distinguish between the game and reality.", owned: true)
mann = Director.create(name: "Michael Mann")
mann.movies << Movie.create(title: "Heat", year: "1995", description: "A group of professional bank robbers start to feel the heat from police when they unknowingly leave a clue at their latest heist, while both sides attempt to find balance between their personal and their professional lives.", owned: true)
mann.movies << Movie.create(title: "The Last of the Mohicans", year: "1992", description: "Three trappers protect a British Colonel's daughters in the midst of the French and Indian War.", owned: false)
