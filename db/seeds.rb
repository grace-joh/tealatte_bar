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

@black_mt = @teas.drinks.create!(name: 'Black Milk Tea', calories: 270, has_milk: true)
@jasmine_mt = @teas.drinks.create!(name: 'Jasmine Milk Tea', calories: 230, has_milk: true)
@matcha_mt = @teas.drinks.create!(name: 'Matcha Milk Tea', calories: 250, has_milk: true)
@strawberry_ot = @teas.drinks.create!(name: 'Strawberry Oolong Tea', calories: 220, has_milk: false)
@peach_gt = @teas.drinks.create!(name: 'Peach Green Tea', calories: 200, has_milk: false)
@tropic_osmanthus = @teas.drinks.create!(name: 'Tropic Osmanthus', calories: 240, has_milk: false)

@americano = @coffee.drinks.create!(name: 'Americano', calories: 150, has_milk: false)
@latte = @coffee.drinks.create!(name: 'Latte', calories: 230, has_milk: true)
@caramel_macchiato = @coffee.drinks.create!(name: 'Caramel Macchiato', calories: 280, has_milk: true)
@cold_brew = @coffee.drinks.create(name: 'Cold Brew', calories: 180, has_milk: false)

@mocha_frappe = @frappes.drinks.create!(name: 'Mocha Frappe', calories: 350, has_milk: true)
@matcha_frappe = @frappes.drinks.create!(name: 'Matcha Frappe', calories: 320, has_milk: true)
@caramel_frappe = @frappes.drinks.create!(name: 'Caramel Frappe', calories: 340, has_milk: true)
@vanilla_bean_frappe = @frappes.drinks.create!(name: 'Vanilla Bean Frappe', calories: 340, has_milk: true)
@oreo_frappe = @frappes.drinks.create!(name: 'Oreo Frappe', calories: 380, has_milk: true)

@strawberry_smth = @smoothies.drinks.create!(name: 'Strawberry Smoothie', calories: 320, has_milk: true)
@mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, has_milk: true)
@watermelon_smth = @smoothies.drinks.create!(name: 'Watermelon Smoothie', calories: 260, has_milk: true)
@pina_colada_smoothie = @smoothies.drinks.create!(name: 'Pina Colada Smoothie', calories: 270, has_milk: true)

@mango_slush = @slushes.drinks.create!(name: 'Mango Slush', calories: 250, has_milk: false)
@lychee_slush = @slushes.drinks.create!(name: 'Lychee Slush', calories: 240, has_milk: false)
@passion_fruit_slush = @slushes.drinks.create!(name: 'Passion Fruit Slush', calories: 240, has_milk: false)

@classic_lemonade = @lemonades.drinks.create!(name: 'Classic Lemonade', calories: 180, has_milk: false)
@strawberry_lemonade = @lemonades.drinks.create!(name: 'Strawberry Lemonade', calories: 200, has_milk: false)
@waikiki_sunset = @lemonades.drinks.create!(name: 'Waikiki Sunset Lemonade', calories: 240, has_milk: false)