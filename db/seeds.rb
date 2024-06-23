# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'user1', password: 'password')
User.create(username: 'admin', password: 'password', admin: true)
admin_user = User.find_by(username: "admin")

admin_user.cars.create!(
  make: "Chevy",
  model: "Bolt EV",
  year: "2020",
  ac: 'true',
  transmission: "Автомат",
  color: "сірий",
  max_capacity: 5,
  price: 32000,
  desc: "Автомобіль 2020 року випуску з Пробігом в 15000 км З посиленною та оновленою батареєю.",
  odometer: 15000,
  battery: 259,
  image_url: "https://itc.ua/wp-content/uploads/2023/12/2020-chevrolet-bolt-ev-premier-101-1588025513.jpeg"
)


admin_user.cars.create!(
  make: "Tesla",
  model: "Model S",
  year: "2021",
  ac: 'true',
  transmission: "Автомат",
  color:"білий",
  max_capacity: 5,
  price: 29000,
  desc: "Тесла пригнана з Європи, без ДТП Повний привід Пневмопідвіска. Багата комплектація: панорамний дах, підігрів усіх сидінь та руля, камера, електро багажник , автоматичне дальнє світло",
  odometer: 10000,
  battery: 405,
  image_url: "https://teslapark.com.ua/wp-content/uploads/2023/01/IMG_3195-768x512.jpg"
)

admin_user.cars.create!(
  make: "Ford",
  model: "Mustang Mach-E",
  year: "2021",
  ac: 'true',
  transmission: "Автомат",
  color: "блакитний",
  max_capacity: 7,
  price: 34000,
  desc: "Машина без пошкоджень в багатій комплектації. Без жодного підфарбуваня.",
  odometer: 20000,
  battery: 314,
  image_url: "https://media.cnn.com/api/v1/images/stellar/prod/201214151931-01-ford-mustang-mach-e-electric-suv.jpg?q=w_1110,c_fill/f_webp"
)

new_car = admin_user.cars.create!(
  make: "Nissan",
  model: "Leaf",
  year: "2014",
  ac: 'true',
  transmission: "Автомат",
  color: "білий",
  max_capacity: 5,
  price: 12000,
  desc: "свіжопригнаний (з Норвегії) розмитнений та поставлений не український облік;- тепловий насос;- максимальна комплектація;- Датчик світла дощу;- Камера 360;- шкіряний салон;- підігрів керма;- підігрів передніх та задніх сидінь;- безключовий доступ;- автомобільне складання дзеркал;- сонячна батарея;- Кнопка старт стоп;- Led оптика;- преміум музика BOSE;- Bluetooth, aux, hands-free;- Навігація;- 12 airbag;- сервісна книга, два ключі запалювання;- обслугована не потребує вкладень;- є всі перевірки роботи і життя батареї",
  odometer: 40000,
  battery: 150,
  image_url: "https://img.automoto.ua/auto/Nissan-Leaf-belyiy-Hetchbek-2014-fb7-63653576.webp"
)
