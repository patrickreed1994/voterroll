class Voter < ActiveRecord::Base

  require 'precinct'
  require 'segment'
  require 'name'
  require 'sqlite3'
  
  def self.generate
  	#Alter n to match the number of voter records you want in your roll
  	n = 100

  	(0..n).each do |i|

      # __________INITIATE PRECINCTS AND SEGMENTS SECTION__________

  		#Initiates a random number generator - this will be used to select a house number later on
  		randomizer = Random.new 

  		#Select a random precinct from the list of precincts - this will generate @PrecinctUID and @PrecinctName
  		randomPrecinct = Precinct.order("RANDOM()").first

  		#Select a random segment - this will generate @StreetName, @StreetSuffix, and @StreetDirection
  		# For testing purposes, it is hard coded as 448924 now because the list of precincts is so long. When deploying, change that to randomPrecinct.PrecinctUID.
      randomSegmentList = Segment.where(PrecinctUID: randomPrecinct.PrecinctUID).order("RANDOM()")
  		randomSegment = randomSegmentList.order("RANDOM()").first

  		#Selects a house number from that earlier segment
  		if (randomSegment.StartHouseNumber != nil or randomSegment.StartHouseNumber != 0)
        houseSeed = randomizer.rand(randomSegment.StartHouseNumber..randomSegment.EndHouseNumber)
  		  if (houseSeed % 2 == 0 && randomSegment.OddEvenBoth == "Even")
          houseSeed = houseSeed
  		  elsif (houseSeed % 2 == 1 && randomSegment.OddEvenBoth == "Odd")
          houseSeed = houseSeed
        else
          houseSeed = houseSeed + 1
  		  end
      end

      # Selects a random locality (county) and city
      localityseed = randomizer.rand(1..6)
      localityname = "none"
      city = "none"
      if (localityseed == 1)
        localityname = "Atlas"
        city = ["Pheoton", "Metino", "Arelon", "Los Comienzos", "Los Comienzos Hills", "Los Hydros", "Darkwood", "Daedalas", "Monte Erebo", 
          "Caballo Hill", "Ourean", "Seirenes", "Promedan", "Santa Vulcana", "Hephaestown", "Coastline", "WhitesailHills", "Helion"].sample
      elsif (localityseed == 2)
        localityname = "Blueshores"
        city = ["Admirality", "Helmspeak", "Raftstown", "Shipsmoor", "Sailingame", "Ahoya", "ColdSprings", "Driftwood City", "East Seirenes", "Swiftstream City",
          "GullRock", "Quarterdeck Bay", "Dunesborough", "Riveridge", "MossCreek", "Orange Park", "Deepwater", "Atalanta", "Techreach", "Bluewind", "Windward Valley",
          "Redwood Cove", "DarkwoodShores", "Spinnaker", "Anchortown", "Seafoam", "Blueshores", "Damsbridge", "South Novotech", "Shoreside"].sample
      elsif (localityseed == 3)
        localityname = "Freesource"
        city = ["Freesource", "Analoge", "Gateway", "Lazarus", "Circle", "Datalin", "Cape Este", "Cyberville", "Backend", "Webward", "Hardwire", 
          "Servertown", "Openway", "Pyrite", "Pingmont", "Tagway", "Moraga", "Sharegate", "Export City"].sample
      elsif (localityseed == 4)
        localityname = "Novotech"
        city = "Novotech"
      elsif (localityseed == 5)
        localityname = "Redrock"
        city = ["Greenhill", "Corte Arbol", "Fairtree", "Pond", "Larksong", "Redwood Valley", "Sunwhip", "Littleleaf", "Goldfields", "Claytown", 
          "Wind Harbor", "Bayshore"].sample
      elsif (localityseed == 6)
        localityname = "Whitestar"
        city = ["Alahmar", "Poplar", "Anthony", "Uluru", "CapePoint", "FarrarIsland", "CoalRidge", "Halcon", "Bluefield", "RiojaHills",
         "RiojaValley", "Lazarus", "Driver", "Sequoya", "Madrone", "Carson", "Canteen", "Freeright", "Bailey", "Gatesville", "Demon",
          "ExplorationBay", "Kingsdream", "Bounty", "Carnival", "Mega", "Hemington", "Huichin", "Sire", "Traps", "Garrison", "Noriega Creek",
          "Wrightwind", "Mount Demon", "Franklin", "Hilltop", "Chuck Canyon", "Atchison", "McafeeValley", "Pinemeadow", "Petro", "Quincy Park",
          "Salvio", "Port Potawatomi", "Port Solano", "Jefferson", "Lincoln", "Constitution Hill", "Redstripe", "Tormey", "Madera", "Sarathaly",
          "Whitestripe", "Steinbeck", "Flagrock", "Openspace", "Pontifical University", "Esselen", "GoldenEagle", "Fe", "Vides", "Thoreau", 
          "Suisun Island", "Washington Creek", "Washington Knolls"].sample
      end


      # __________INITIATE NAMES, VOTER IDS, AND DOB SECTION__________

  		#Selects a random name from the name list
  		randomFirstName = Name.all.sort_by{rand}.first
      randomLastName = Name.all.sort_by{rand}.first
      randomMiddleNameList = Name.where(Gender: randomFirstName.Gender).order("RANDOM()")
      randomMiddleName = randomMiddleNameList.order("RANDOM()").first

      #Selects a random number between 100,000,000 and 999,999,999 for the voter's ID number
      idnumber = randomizer.rand(100000000..999999999)

      #selects a DOB
      dob = "testing"
      randommonth = randomizer.rand(1..13).to_s
      randomday = randomizer.rand(1..29).to_s
      randomyear = "holder"
      seedyear = randomizer.rand(1..100)
      if (0 <= seedyear and seedyear <= 21)
        randomyear = randomizer.rand(2000..2006).to_s
      elsif (22 <= seedyear and seedyear <= 44)
        randomyear = randomizer.rand(1985..1999).to_s
      elsif (45 <= seedyear and seedyear <= 67)
        randomyear = randomizer.rand(1970..1984).to_s
      elsif (68 <= seedyear and seedyear <= 85)
        randomyear = randomizer.rand(1955..1969).to_s
      elsif (86 <= seedyear and seedyear <= 95)
        randomyear = randomizer.rand(1940..1954).to_s
      elsif (96 <= seedyear and seedyear <= 98)
        randomyear = randomizer.rand(1925..1939).to_s
      elsif (99 <= seedyear and seedyear <= 100)
        randomyear = randomizer.rand(1906..1924).to_s
      end
      dob = randommonth + "/" + randomday + "/" + randomyear

      #Selects a phone number
      phonenumber = "phone"
      areacode = 999.to_s
      midthree = randomizer.rand(100..999).to_s
      lastfour = randomizer.rand(1000..9999).to_s
      phonenumber = areacode + "." + midthree + "." + lastfour

      #Determines if over 18
      age = 0
      if (randomyear.to_i <= 1996)
        age = 1
      end

      #Distributes primary language
      language = "English"
      seedlang = randomizer.rand(1..100)
      if (0 < seedlang and seedlang <= 3)
        language = "Chinese"
      elsif (4 <= seedlang and seedlang <= 14)
        language = "Other"
      elsif (15 <= seedlang and seedlang <= 43)
        language = "Spanish"
      elsif (44 <= seedlang and seedlang <= 100)
        language = "English"
      end



    # __________SETTING THE PARAMETERS SECTION__________

  	#Sets the first, middle, and last name of the voter in the record
		@FirstName = randomFirstName.FirstName
		@LastName = randomLastName.LastName
		@MiddleName = randomMiddleName.MiddleName
    @Gender = randomFirstName.Gender

		#Sets the PrecinctUID and PrecinctName in the record
		#Set @PrecinctUID = randomPrecinct.PrecinctUID after testing
		#Set @PrecinctName = randomPrecinct.PrecinctName after testing
    #when testing, @PrecinctUID = 448924 and PrecinctName = "9002341A"
		@PrecinctUID = randomPrecinct.PrecinctUID
		@PrecinctName = randomPrecinct.PrecinctName


		#Sets the HouseNumber, StreetName, StreetSuffix, and StreetDirection in the record
		@HouseNumber = houseSeed
		@StreetName = randomSegment.StreetName
		@StreetSuffix = randomSegment.StreetSuffix
		@StreetDirection = randomSegment.StreetDirection

    #Sets voter ID, age, and language
    @IdentificationNumber = idnumber
    @Over18 = age
    @DOB = dob
    @Language = language

    #Sets locality, states, ZIP, and country
    @City = city
    @LocalityName = localityname
    @LocalityCode = localityseed
    @State = "FA"
    @ZIP = 99999
    @Country = "US"

    #Sets phone and email
    @Phone = phonenumber
    @Email = randomFirstName.FirstName.downcase + "." + randomLastName.LastName.downcase + "." + idnumber.to_s + "@gmail.com"


    # __________HASHING SECTION__________


		#Creates a voter hash put the record together in the database
  		voter_hash = Hash.new
  		voter_hash = { "id" => i, "IdentificationNumber" => @IdentificationNumber, "FirstName" => @FirstName, "LastName" => @LastName, "MiddleName" => @MiddleName, "PrecinctUID" => @PrecinctUID, 
  		"PrecinctName" => @PrecinctName, "HouseNumber" => @HouseNumber, "StreetName" => @StreetName, "StreetSuffix" => @StreetSuffix, 
  		"StreetDirection" => @StreetDirection, "Gender" => @Gender, "DOB" => @DOB, "LocalityName" => @LocalityName, "State" => @State, "ZIP" => @ZIP, 
      "Country" => @Country, "Phone" => @Phone, "LocalityCode" => @LocalityCode, "Email" => @Email, "Over18" => @Over18, "Language" => @Language, 
      "City" => @City}

  		voter = Voter.where(id: voter_hash["id"])
  	
  		if voter.count == 1
        	voter.first.update_attributes(voter_hash)
    	else
        	Voter.create!(voter_hash)
        end
    end
  end
end
