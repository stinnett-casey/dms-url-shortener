# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'securerandom'
@link1 = Link.create({original_url: 'https://google.com', token: SecureRandom.hex(3), times_visited: 4})
@link2 = Link.create({original_url: 'https://facebook.com', token: SecureRandom.hex(3), times_visited: 6})
@link3 = Link.create({original_url: 'https://twitter.com', token: SecureRandom.hex(3), times_visited: 2})
@link4 = Link.create({original_url: 'https://linkedin.com', token: SecureRandom.hex(3), times_visited: 3})
@link5 = Link.create({original_url: 'https://cnn.com', token: SecureRandom.hex(3), times_visited: 1})

Click.create([
  {link: @link1, created_at: DateTime.now-1.days},
  {link: @link1, created_at: DateTime.now-2.days},
  {link: @link1, created_at: DateTime.now-2.days},
  {link: @link1, created_at: DateTime.now-1.days},

  {link: @link2, created_at: DateTime.now-3.days},
  {link: @link2, created_at: DateTime.now-3.days},
  {link: @link2, created_at: DateTime.now-3.days},
  {link: @link2, created_at: DateTime.now-2.days},
  {link: @link2, created_at: DateTime.now-1.days},
  {link: @link2, created_at: DateTime.now-1.days},

  {link: @link3, created_at: DateTime.now-1.days},
  {link: @link3, created_at: DateTime.now-2.days},

  {link: @link4, created_at: DateTime.now-2.days},
  {link: @link4, created_at: DateTime.now-3.days},
  {link: @link4, created_at: DateTime.now-2.days},

  {link: @link5, created_at: DateTime.now-2.days}
])