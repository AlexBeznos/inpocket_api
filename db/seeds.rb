# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.create!(
  name: 'Vapiano',
  description: 'Идея популяризации домашней итальянской кухни пришла к нам из Германии, где и появилось первое кафе всемирно известной сети Vapiano в 2002 году. Открывая заведения сети в Москве, мы постарались донести до столичных гурманов основополагающую концепцию Vapiano в первоначальном виде.',
  logo: 'http://www.downtowndc.org/sites/default/files/images/poi/Vapiano%20Logo.jpg',
  address: 'Червоноармiйська-Бассейна 1-3/2 Kyiv'
)

Place.create!(
  name: 'CoffeetoriaLounge',
  description: 'Кофетория лаунж открылась в апреле 2015 года, на момент публикации ей как раз исполнилось 1 год. Расположена она в пешей досягаемости от метро Шулявская, но с первого раза её можно и не заметить, подумав, что это обычная кофейня у метро, которых здесь масса.',
  logo: 'http://kalyan.bar/wp-content/uploads/2016/03/coffeetoria-logo.gif',
  address: 'Киев, пр-т Победы, 47-А '
)
