# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Poi.create(:name => 'Saint Mark\'s Basilica', :lat => 45.434843, :lon => 12.339981, :image_url => 'http://www.frammentiarte.it/dal%20Gotico/Chiese/5%20Venezia%20-%20Basilica%20di%20San%20Marco.jpg', :description => 'The Patriarchal Cathedral Basilica of Saint Mark (officially known in Italian as the Basilica Cattedrale Patriarcale di San Marco and commonly known as Saint Mark\'s Basilica) is the cathedral church of the Roman Catholic Archdiocese of Venice, northern Italy. It is the most famous of the city\'s churches and one of the best known examples of Italo-Byzantine architecture. ')

Poi.create(:name => 'Doge\'s Palace', :lat => 45.433783, :lon => 12.340207, :image_url => 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Palazzo_ducale_12.JPG')
Poi.create(:name => 'St Mark\'s Campanile', :lat => 45.433769, :lon => 12.339044, :image_url => 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Venezia_Campanile_di_San_Marco_003.JPG', :description => 'St Mark\'s Campanile (Campanile di San Marco in Italian) is the bell tower of St Mark\'s Basilica in Venice, Italy, located in the Piazza San Marco. It is one of the most recognizable symbols of the city.')

Poi.create(:name => 'Bridge of Sighs', :lat => 45.433942, :lon => 12.340321, :image_url => 'https://upload.wikimedia.org/wikipedia/commons/8/8c/The_bridge_of_sighs.JPG',
  :description => 'The Bridge of Sighs (Italian: Ponte dei Sospiri) is a bridge located in Venice, northern Italy. The enclosed bridge is made of white limestone and has windows with stone bars. It passes over the Rio di Palazzo and connects the New Prison (Prigioni Nuove) to the interrogation rooms in the Doge\'s Palace. It was designed by Antonio Contino (whose uncle Antonio da Ponte had designed the Rialto Bridge) and was built in 1600.')

Poi.create(:name => 'Chiesa di San Zaccaria', :lat => 45.434649, :lon => 12.343126, :image_url => 'https://upload.wikimedia.org/wikipedia/commons/6/69/Chiesa_di_San_Zaccaria_Venezia.jpg', :description => 'San Zaccaria is a church in Venice, northern Italy, dedicated to Saint Zechariah, although his cult is often superimposed with that of the father of John the Baptist, whose body it conserves, under the second altar on the right. It is a large edifice, located in the quiet Campo San Zaccaria, just off the waterfront to the south east of St. Mark\'s basilica.')

Poi.create(:name => 'Biblioteca Nazionale Marciana', :lat => 45.43334, :lon => 12.339632, :image_url => 'http://www.giuseppeborsoi.it/wp-content/uploads/2009/11/Biblioteca-Nazionale-Marciana.JPG', :description => 'The Biblioteca Nazionale Marciana (English: National Library of St Mark\'s) is a library and Renaissance building in Venice, northern Italy; it is one of the earliest surviving public manuscript depositories in the country, holding one of the greatest classical texts collections in the world. The library is named after St. Mark, the patron saint of Venice. It is not to be confused with the State Archive of the Republic of Venice, which is housed in a different part of the city.')
