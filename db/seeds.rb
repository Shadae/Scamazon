# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {user_name: 'Davida', email: 'davida@davidamail.com', password: 'password', password_confirmation: 'password'}, 
  {user_name: 'Shadae', email: 'shadae@shadae.com', password: 'password', password_confirmation: 'password'}, 
  {user_name: 'Ellen', email: 'ellen@ellen.com', password: 'password', password_confirmation: 'password'}, 
  {user_name: 'Christina', email: 'christina@chris.com', password: 'password', password_confirmation: 'password'},
  {user_name: 'Kerri', email: 'test@test.com', password: 'password', password_confirmation: 'password'},
  {user_name: 'Bookis', email: 'test2@test.com', password: 'password', password_confirmation: 'password'}])

categories = Category.create([{category: 'housewares'}, {category: 'linens'}, {category: 'entertaining'},{category: 'kitchen'},{category: 'appliances'}])

products = Product.create([
  {name: 'Noomi Napkin', description: 'Cotton napkin trellises intricate and ethnic in festive green and red pattern.', price: 399, stock: 2, user_id: 1}, 
  {name: 'Big Red Wine Glass', description: 'Classic wine shape is crafted with pulled stem and fire-polished rim.', price: 695, stock: 5, user_id: 2}, 
  {name: 'Birdy Napkin Ring', description: 'Silvery bird tweets a friendly welcome for any kind of gathering.', price: 495, stock: 7, user_id: 4}, 
  {name: '5-Piece Roscoe Bowl Set', description: 'Soft shapes register somewhere between round and triangular in this versatile nesting set of bowls, matte-glazed in a chic range of tonal greys.', price: 2995, stock: 10, user_id: 4}, 
  {name: 'Reversible Double Griddle', description: 'Reversible griddle boasts a deep well for drippings and a reverse side with grilling grooves. Also great for thawing frozen foods.', price: 4995, stock: 20, user_id: 2},
  {name: 'Lodge® Cast Iron Dutch Oven', description: ' Ready-to-use pre-seasoned Dutch oven gives that homespun cast-iron appeal and solid performance for stovetop or oven braises, stews, casseroles and other one-pot favorites', price: 5995, stock: 5, user_id: 3}, 
  {name: 'Malabar Pillow', description: 'Handwoven design spikes an abstract band of dynamic, tonal pattern on broad swaths of deep blue and forest green', price: 1295, stock: 5, user_id: 1},
  {name: 'Cellar Acacia Wood Salad Set', description: "Naturally stunning and totally fresh, this curvy wooden salad bowl from The Cellar's collection of serveware and serving dishes tops the table with easy modern style. With coordinating acacia-wood servers.", price: 5099, stock: 5, user_id: 4},
  {name: 'Cellar Acacia Wood Curved Chip and Dip', description: "Wood works. Beautifully crafted in rich acacia wood and ceramic materials, this unique chip-and-dip brings a casual, organic feel to any setting. An entertaining staple, from The Cellar.", price: 3399, stock: 20, user_id: 2},
  {name: 'Cellar Acacia Wood 5 Section Tray', description: "Wood works. Beautifully crafted in rich acacia wood and white ceramic, this 5-section serving tray brings a casual, organic feel to any setting. An entertaining staple, from The Cellar.", price: 3399, stock: 3, user_id: 3},
  {name: 'Cellar Acacia Wood Flatware Caddy', description: "Wood works. Beautifully crafted in rich acacia wood and white ceramic, this 5-section serving tray brings a casual, organic feel to any setting. An entertaining staple, from The Cellar.", price: 2499, stock: 3, user_id: 3},
  {name: 'KitchenAid KSB1575 Blender', description: "Skip the hassle of prep work & leave it up to this professional blender. With 5 speeds, Intelli-Speed™ Technology that senses density changes & maintains premium power & a stainless steel blade for wet & dry blending, this blender takes on the toughest & most stubborn ingredients with precision & ease.", price: 14999, stock: 8, user_id: 1},
  {name: 'SodaStream Source Soda Maker Starter Kit', description: "Soda in seconds! Including a carbonator, reusable BPA-free bottle and a sample pack, this soda maker revolutionizes the way you sip the bubbly. Plus, making soda at home saves money, time & the earth! ", price: 9999, stock: 5, user_id: 2},
   {name: 'Martha Stewart Collection Flexi Mats', description: "A set of four color-coded flexible mats provide the perfect prep space for cooking vegetables, fish, poultry and meat. Food finds a home on these silicone-backed mats, which stay firmly in place during prep and eliminate extra countertop mess.", price: 9999, stock: 8, user_id: 3},
    {name: 'Charter Club 400 Thread Count Queen Sheet Set', description: "Sleep snug. Finely woven single-ply yarns in luxe 400-thread count cotton offer a fabric that is exceptionally soft, smooth and strong in this Tailored Fit Solid sheet set from Charter Club. Features a wrinkle-resistant finishing process, quick try technology for less time in the dryer and stretch technology that keeps the fitted sheet secure and in place.", price: 7999, stock: 5, user_id: 4},
    {name: 'Hotel Collection Bath Towels, MicroCotton', description: "Five-Star luxury, now for your home. Hotel Collection towels are made from 100% ringspun MicroCotton for an incredibly soft touch and luxurious feel. With distinctive ribbed hem detail.", price: 1799, stock: 30, user_id: 2}])