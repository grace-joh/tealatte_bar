# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Drink.destroy_all

@lemonades = Category.create!(name: 'Lemonade', price: 5, caffeinated: false)
@slushes = Category.create!(name: 'Slushes', price: 4, caffeinated: false)
@smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
@frappes = Category.create!(name: 'Frappes', price: 7, caffeinated: true)
@coffee = Category.create!(name: 'Coffee', price: 6, caffeinated: true)
@teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)

@black_mt = @teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
@jasmine_mt = @teas.drinks.create!(name: 'Jasmine Milk Tea', calories: 230, in_season: true)
@matcha_mt = @teas.drinks.create!(name: 'Matcha Milk Tea', calories: 250, in_season: true)
@strawberry_ot = @teas.drinks.create!(name: 'Strawberry Oolong Tea', calories: 220, in_season: true)
@peach_gt = @teas.drinks.create!(name: 'Peach Green Tea', calories: 200, in_season: true)
@tropic_osmanthus = @teas.drinks.create!(name: 'Tropic Osmanthus', calories: 240, in_season: false)

@americano = @coffee.drinks.create!(name: 'Americano', calories: 150, in_season: true)
@latte = @coffee.drinks.create!(name: 'Latte', calories: 230, in_season: true)
@caramel_macchiato = @coffee.drinks.create!(name: 'Caramel Macchiato', calories: 280, in_season: true)
@cold_brew = @coffee.drinks.create(name: 'Cold Brew', calories: 180, in_season: false)

@mocha_frappe = @frappes.drinks.create!(name: 'Mocha Frappe', calories: 350, in_season: true)
@matcha_frappe = @frappes.drinks.create!(name: 'Matcha Frappe', calories: 320, in_season: true)
@caramel_frappe = @frappes.drinks.create!(name: 'Caramel Frappe', calories: 340, in_season: true)
@vanilla_bean_frappe = @frappes.drinks.create!(name: 'Vanilla Bean Frappe', calories: 340, in_season: false)
@oreo_frappe = @frappes.drinks.create!(name: 'Oreo Frappe', calories: 380, in_season: true)

@strawberry_smth = @smoothies.drinks.create!(name: 'Strawberry Smoothie', calories: 320, in_season: true)
@mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, in_season: true)
@watermelon_smth = @smoothies.drinks.create!(name: 'Watermelon Smoothie', calories: 260, in_season: false)
@pina_colada_smoothie = @smoothies.drinks.create!(name: 'Pina Colada Smoothie', calories: 270, in_season: true)

@mango_slush = @slushes.drinks.create!(name: 'Mango Slush', calories: 250, in_season: true)
@lychee_slush = @slushes.drinks.create!(name: 'Lychee Slush', calories: 240, in_season: true)
@passion_fruit_slush = @slushes.drinks.create!(name: 'Passion Fruit Slush', calories: 240, in_season: false)

@classic_lemonade = @lemonades.drinks.create!(name: 'Classic Lemonade', calories: 180, in_season: true)
@strawberry_lemonade = @lemonades.drinks.create!(name: 'Strawberry Lemonade', calories: 200, in_season: true)
@waikiki_sunset = @lemonades.drinks.create!(name: 'Waikiki Sunset Lemonade', calories: 240, in_season: false)
