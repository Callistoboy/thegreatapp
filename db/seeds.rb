# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Image.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('images')
Image.create([

                 {name: 'современный интерьер, вариант 1', file: 'app/assets/images/themes/m1.jpg', theme_id: 4},
                 {name: 'современный интерьер, вариант 2', file: 'app/assets/images/themes/m2.jpg', theme_id: 4},
                 {name: 'современный интерьер, вариант 3', file: 'app/assets/images/themes/m3.jpg', theme_id: 4},
                 {name: 'современный интерьер, вариант 4', file: 'app/assets/images/themes/m4.jpg', theme_id: 4},
                 {name: 'современный интерьер, вариант 5', file: 'app/assets/images/themes/m5.jpg', theme_id: 4},
                 {name: 'скандинавский интерьер, вариант 1', file: 'app/assets/images/themes/s1.jpg', theme_id: 1},
                 {name: 'скандинавский интерьер, вариант 2', file: 'app/assets/images/themes/s2.jpg', theme_id: 1},
                 {name: 'скандинавский интерьер, вариант 3', file: 'app/assets/images/themes/s3.jpg', theme_id: 1},
                 {name: 'скандинавский интерьер, вариант 4', file: 'app/assets/images/themes/s4.jpg', theme_id: 1},
                 {name: 'скандинавский интерьер, вариант 5', file: 'app/assets/images/themes/s5.jpg', theme_id: 1},
                 {name: 'классический интерьер, вариант 1', file: 'app/assets/images/themes/c1.jpg', theme_id: 2},
                 {name: 'классический интерьер, вариант 2', file: 'app/assets/images/themes/c2.jpg', theme_id: 2},
                 {name: 'классический интерьер, вариант 3', file: 'app/assets/images/themes/c3.jpg', theme_id: 2},
                 {name: 'лофт, вариант 1', file: 'app/assets/images/themes/l1.jpg', theme_id: 3},
                 {name: 'лофт, вариант 2', file: 'app/assets/images/themes/l2.jpg', theme_id: 3},
                 {name: 'лофт, вариант 3', file: 'app/assets/images/themes/l3.jpg', theme_id: 3},
             ])

Theme.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('themes')
Theme.create([

                 {name: "Скандинавский стиль"},      # 1
                 {name: "Классический стиль"},      # 2
                 {name: "Лофт"},      # 3
                 {name: "Современный стиль"},  # 4
             ])

User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
User.create([

                {name: "Артем", email: "styleforyou.djart@gmail.com", password: "password", password_confirmation: "password"},
            ])