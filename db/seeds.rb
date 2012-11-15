# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Hero, Concept, Implementation, Comment].each do |klass|
	klass.destroy_all
end

Hero.create(identity: 'faitswulff', email: 'brian@callmekung.com', 
	password: '123456', password_confirmation: '123456')

[Implementation, Concept].each do |klass|
	instance = klass.new
	instance.name = 'Test Implementation'
	instance.hero_id = Hero.first.id
	instance.save
end

puts 'No errors.'