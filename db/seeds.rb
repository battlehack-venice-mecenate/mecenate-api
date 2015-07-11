# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Poi.create(:name => 'Saint Mark\'s Basilica', :lat => 45.434843, :lon => 12.339981, :image_url => 'http://www.frammentiarte.it/dal%20Gotico/Chiese/5%20Venezia%20-%20Basilica%20di%20San%20Marco.jpg')
Poi.create(:name => 'Doge\'s Palace', :lat => 45.433783, :lon => 12.340207, :image_url => 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Palazzo_ducale_12.JPG')
Poi.create(:name => 'St Mark\'s Campanile', :lat => 45.433769, :lon => 12.339044, :image_url => 'https://commons.wikimedia.org/wiki/File:Venezia_Campanile_di_San_Marco_003.JPG#/media/File:Venezia_Campanile_di_San_Marco_003.JPG')
Poi.create(:name => 'Bridge of Sighs', :lat => 45.433942, :lon => 12.340321, :image_url => 'https://commons.wikimedia.org/wiki/File:The_bridge_of_sighs.JPG#/media/File:The_bridge_of_sighs.JPG')
Poi.create(:name => 'Chiesa di San Zaccaria', :lat => 45.434649, :lon => 12.343126, :image_url => 'https://commons.wikimedia.org/wiki/File:Chiesa_di_San_Zaccaria_Venezia.jpg#/media/File:Chiesa_di_San_Zaccaria_Venezia.jpg')
Poi.create(:name => 'Biblioteca Nazionale Marciana', :lat => 45.43334, :lon => 12.339632, :image_url => 'http://www.giuseppeborsoi.it/wp-content/uploads/2009/11/Biblioteca-Nazionale-Marciana.JPG')
