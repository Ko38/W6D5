# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.delete_all
Catrentalrequest.delete_all
cat1 = Cat.create!(birth_date: '1990/01/01', color: :blue, sex: :M, name: "Spotty", description: "Great cat")
cat2 = Cat.create!(birth_date: '2001/04/17', color: :brown, sex: :F, name: "Lucky", description: "Decent cat")
cat3 = Cat.create!(birth_date: '2014/12/20', color: :white, sex: :M, name: "Tom", description: "Tom likes Jerry")

catrentalrequest1 = Catrentalrequest.create!(cat_id: cat1.id, start_date: '2019/08/01', end_date: '2019/08/05', status:'PENDING')
catrentalrequest4 = Catrentalrequest.create!(cat_id: cat1.id, start_date: '2019/08/01', end_date: '2019/08/03', status:'APPROVED')
catrentalrequest5 = Catrentalrequest.create!(cat_id: cat1.id, start_date: '2019/08/01', end_date: '2019/08/04', status:'PENDING')
catrentalrequest2 = Catrentalrequest.create!(cat_id: cat2.id, start_date: '2019/08/03', end_date: '2019/08/05', status:'PENDING')
catrentalrequest3 = Catrentalrequest.create!(cat_id: cat3.id, start_date: '2019/08/02', end_date: '2019/08/05', status:'PENDING')