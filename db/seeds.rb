# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Place.create!(
#   name: 'Vapiano',
#   description: 'Идея популяризации домашней итальянской кухни пришла к нам из Германии, где и появилось первое кафе всемирно известной сети Vapiano в 2002 году. Открывая заведения сети в Москве, мы постарались донести до столичных гурманов основополагающую концепцию Vapiano в первоначальном виде.',
#   logo: 'http://www.downtowndc.org/sites/default/files/images/poi/Vapiano%20Logo.jpg',
#   address: 'Червоноармiйська-Бассейна 1-3/2 Kyiv'
# )
#
# Place.create!(
#   name: 'CoffeetoriaLounge',
#   description: 'Кофетория лаунж открылась в апреле 2015 года, на момент публикации ей как раз исполнилось 1 год. Расположена она в пешей досягаемости от метро Шулявская, но с первого раза её можно и не заметить, подумав, что это обычная кофейня у метро, которых здесь масса.',
#   logo: 'http://kalyan.bar/wp-content/uploads/2016/03/coffeetoria-logo.gif',
#   address: 'Киев, пр-т Победы, 47-А '
# )

# Present.create!(
#   name: 'Карбонара',
#   description: 'Alla carbonara — самая, пожалуй, знаменитая итальянская подливка к пасте (не только к спагетти, но и к другим видам тоже), приготовленная по способу карбонариев. В нее входит всего три ингредиента: грудинка, яйца и тертый пармезан. ',
#   image: 'http://s1.afisha-eda.ru/Photos/150525210126-150601174518-p-O-pasta-karbonara-pasta-alla-carbonara.jpg',
#   price: '20',
#   place_id: 1
# )
#
# Present.create!(
#   name: 'Диабло',
#   description: 'Пицца Диабло создана специально для любителей по-настоящему острых ощущений. В ней вкус свежих помидоров, сочной говядины, ветчины и салями пикантно дополнен острой и пряной колбасой пепперони и жгучим перцем халапеньо.',
#   image: 'http://pizzafab.ru/pictures/pizza/photo/catalog_photo_57.png',
#   price: '30',
#   place_id: 1
# )
#
# desc_1 =  <<-HEREDOC
#       Закажите два любых блюда в рамках одной категории: «Суши-бар», «Закуски, салаты и якитори», «Супы», «Горячие блюда, WOK и гарниры», «Десерты» - оплатите одно. Оплачивается блюдо наибольшее или равное по цене. Блюдо, наименьшее или равное по цене, вы получаете бесплатно. Заказав один напиток, второй такой же вы получаете бесплатно.
#
#       Акция не действует в праздничные дни. Акция распространяется только на блюда Евро-азиатского меню.
#
#       С другими скидками, акциями и спецпредложениями не суммируется. Действует при наличии соответствующих рекламных объявлений. Действует только для предъявителей дисконтных карт «ЕВРАЗИЯ BONUS».
#
#       Не действует на блюда Евро-азиатского меню и напитки следующих категорий: «Сэндвичи и омлеты», «Бизнес/Бенто/Азиатский-ланчи», «Детское меню», «Суши-сет конструктор», «Суши ассорти», «Супер цены на бутылки», «Спецпредложения (распродажные позиции)», «Сигаретные наборы/сигареты», «Кальяны».
#
#       Важно: акция «Счастливые часы по будням 1+1=1 с ОТКРЫТИЯ до 18:00» не действует на акцию "Суши за 49", «Наборы для своих» и «Азиатский ланч».
#     HEREDOC
#
# desc_2 = <<-HEREDOC
#       НА ЛЮБИМЫЕ СУШИ И РОЛЛЫ В НАБОРАХ - СКИДКИ ДО 70%!
#       Акция действует только на суши и роллы в наборах, указанные в Спецменю.
#
#       Спецпредложением по Наборам может воспользоваться как гость с дисконтной картой "Евразия Bonus", так и без нее.
#       Для гостей с дисконтной картой "Евразия Bonus" действует спеццена со скидкой до 70% от базовой цены (выделена красным).
#       Для гостей без дисконтной карты "Евразия Bonus" предлагается спеццена со скидкой -10% от базовой цены (отмечена как "цена без карты").
#       Базовая цена на наборы указана в спецменю. Цены на сайте указаны уже с учетом скидок.
#
#       Полный ассортимент меню и цены суши и роллов в Наборах можно  посмотреть здесь
#
#       На данное предложение не действуют акции, в том числе акция "Счастливые часы".
#       Скидки по дисконтным картам "Евразия BONUS" не предоставляются.
#       С другими скидками, акциями и спецпредложениями не суммируется.
#       Предложение не распространяется на Наборы, приобретаемые на вынос (с собой).
#       Предложение действительно на момент предоставления Спецменю в ресторане.
#     HEREDOC
#
# Share.create!(
#   name: 'СЧАСТЛИВЫЕ ЧАСЫ ПО БУДНЯМ! 1+1=1',
#   description: desc_1,
#   image: 'http://www.evrasia.spb.ru/public_img/1.jpg',
#   place_id: 1
# )
#
# Share.create!(
#   name: 'СУПЕР НАБОРЫ -70%!',
#   description: desc_2,
#   image: 'http://www.evrasia.spb.ru/public_img/134.jpg',
#   place_id: 1
# )

MenuCategory.create!(
  name: 'Антипаста',
  place_id: 1
)
MenuCategory.create!(
  name: 'Паста',
  place_id: 1
)
MenuCategory.create!(
  name: 'Пицца',
  place_id: 1
)
MenuCategory.create!(
  name: 'Десерты',
  place_id: 1
)
MenuCategory.create!(
  name: 'Кофе и другое',
  place_id: 1
)
