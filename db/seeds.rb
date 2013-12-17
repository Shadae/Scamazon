# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{user_name: 'Davida', email: 'davida@davidamail.com', password: 'password', password_confirmation: 'password'}, {user_name: 'Shadae', email: 'shadae@shadae.com', password: 'password', password_confirmation: 'password'}, {user_name: 'Ellen', email: 'ellen@ellen.com', password: 'password', password_confirmation: 'password'}, {user_name: 'Christian', email: 'christina@chris.com', password: 'password', password_confirmation: 'password'}])

categories = Category.create([{category: 'housewares'}, {category: 'linens'}, {category: 'entertaining'},{category: 'kitchen'}])

products = Product.create([{name: 'Noomi Napkin',description: 'Noomi Napkin.
Cotton napkin trellises intricate and ethnic in festive green and red pattern.',price: 399, stock: 2, user_id: 1}, {name: 'Big Red Wine Glass',description: 'Classic wine shape is crafted with pulled stem and fire-polished rim.', price: 695, stock: 5, user_id: 2}, {name: 'Birdy Napkin Ring', description: 'Silvery bird tweets a friendly welcome for any kind of gathering.', price: 495, stock:7, user_id: 4}, {name: '5-Piece Roscoe Bowl Set', description: 'Soft shapes register somewhere between round and triangular in this versatile nesting set of bowls, matte-glazed in a chic range of tonal greys.', price: 2995, stock: 10, user_id: 4}, {name: 'Reversible Double Griddle', description: 'Reversible griddle boasts a deep well for drippings and a reverse side with grilling grooves. Also great for thawing frozen foods.', price: 4995, stock: 20, user_id: 2},{name: 'Lodge® Cast Iron Dutch Oven', description: ' Ready-to-use pre-seasoned Dutch oven gives that homespun cast-iron appeal and solid performance for stovetop or oven braises, stews, casseroles and other one-pot favorites', price: 5995, stock: 5, user_id: 3}, {name: 'Malabar Pillow', description: 'Handwoven design spikes an abstract band of dynamic, tonal pattern on broad swaths of deep blue and forest green', price:1295, stock: 5, user_id: 1}])