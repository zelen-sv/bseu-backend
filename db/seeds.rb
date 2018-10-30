# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@inter.bseu.by',
             password: '12345678',
             password_confirmation: '12345678')
Bid.create!(first_name: 'Stas',
            second_name: 'Zelenko',
            gender: 1,
            birthday: '11/22/1994',
            passport_starts_at: '11/22/1994',
            passport_ends_at: '11/22/1994',
            passport_authority: 'Московское РУВД',
            education_type: 'Первое высшее',
            education_form: 'очно',
            nationality: 'Belarus',
            passport_id: 12345678,
            hostel: true,
            arrival_date: '11/22/1994',
            email: 'stas@mail.ru',
            phone: '375293079905')


