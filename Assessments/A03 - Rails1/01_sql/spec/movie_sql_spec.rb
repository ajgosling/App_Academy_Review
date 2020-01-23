require 'rspec'
require 'movie_sql'

describe "#zoolander_cast" do
  it "1. List Zoolander cast by name" do
    expect(zoolander_cast).to eq([
      {"name"=>"Alexander Skarsgård"},
      {"name"=>"Andy Dick"},
      {"name"=>"Anne Meara"},
      {"name"=>"Ben Stiller"},
      {"name"=>"Christine Taylor"},
      {"name"=>"David Duchovny"},
      {"name"=>"James Marsden"},
      {"name"=>"Jennifer Coolidge"},
      {"name"=>"Jerry Stiller"},
      {"name"=>"John Vargas"},
      {"name"=>"Jon Voight"},
      {"name"=>"Justin Theroux"},
      {"name"=>"Matt Levin"},
      {"name"=>"Milla Jovovich"},
      {"name"=>"Nora Dunn"},
      {"name"=>"Owen Wilson"},
      {"name"=>"Patton Oswalt"},
      {"name"=>"Tony Kanal"},
      {"name"=>"Will Ferrell"},
      {"name"=>"Woodrow Asai"}
    ])
  end
end

describe "#harrison_ford_films" do
  it "2. List Harrison Ford films by movie title" do
    expect(harrison_ford_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Firewall" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Hollywood Homicide" },
      { "title" => "Indiana Jones and the Last Crusade" },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Presumed Innocent" },
      { "title" => "Regarding Henry" },
      { "title" => "Sabrina" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Six Days Seven Nights" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Devil's Own" },
      { "title" => "The Fugitive" },
      { "title" => "The Star Wars Holiday Special" },
      { "title" => "What Lies Beneath" },
      { "title" => "Witness" }
    ])
  end
end

describe "#harrison_ford_supporting_actor_films" do
  it "3. List Harrison Ford supporting actor films by title" do
    expect(harrison_ford_supporting_actor_films).to eq([
      { "title" => "A Hundred and One Nights" },
      { "title" => "American Graffiti" },
      { "title" => "Apocalypse Now" },
      { "title" => "Dead Heat on a Merry-Go-Round" },
      { "title" => "Extraordinary Measures" },
      { "title" => "Force 10 From Navarone" },
      { "title" => "Hawthorne of the U.S.A." },
      { "title" => "Jimmy Hollywood" },
      { "title" => "More American Graffiti" },
      { "title" => "Morning Glory" },
      { "title" => "Sally of the Sawdust" },
      { "title" => "Shadows" },
      { "title" => "Smilin' Through" },
      { "title" => "Star Wars Episode IV: A New Hope" },
      { "title" => "Star Wars Episode V: The Empire Strikes Back" },
      { "title" => "Star Wars Episode VI: Return of the Jedi" },
      { "title" => "The Conversation" },
      { "title" => "The Star Wars Holiday Special" },
    ])
  end
end

describe "#leading_star_for_1910_films" do
  it "4. List 1910 leading stars by movie title" do
     expect(leading_star_for_1910_films).to eq([
       {"title"=>"A Christmas Carol", "name"=>"Marc McDermott"},
       {"title"=>"In the Border States", "name"=>"Charles West"},
       {"title"=>"The Blue Bird", "name"=>"Edward Rigby"},
       {"title"=>"The House with Closed Shutters", "name"=>"Henry B. Walthall"},
       {"title"=>"The Unchanging Sea", "name"=>"Arthur V. Johnson"}
     ])
   end
end

describe "#no_casting_info" do
  it "5. Give the movie from 1920 with no casting information" do
    expect(no_casting_info).to eq([
      {"title"=>"The Mark of Zorro"}
    ])
  end
end

describe "#big_movie_stars" do
  it "6. List movies having > 60 roles" do
    expect(big_movies).to eq([
      {"title"=>"A Hundred and One Nights", "roles"=>70},
      {"title"=>"Perfect", "roles"=>78},
      {"title"=>"S.W.A.T.", "roles"=>68}
    ])
  end
end

describe "#julie_andrews_stars" do
  it "7. List the leading actor for all Julie Andrew films (by movie title)" do
    expect(julie_andrews_stars).to eq([
      { "title" => "10", "name" => "Dudley Moore" },
      { "title" => "Darling Lili", "name" => "Julie Andrews" },
      { "title" => "Despicable Me", "name" => "Steve Carell" },
      { "title" => "Relative Values", "name" => "Julie Andrews" },
      { "title" => "S.O.B.", "name" => "Julie Andrews" },
      { "title" => "Star!", "name" => "Julie Andrews" },
      { "title" => "The Americanization of Emily", "name" => "James Garner" },
      { "title" => "The Pink Panther Strikes Again", "name" => "Peter Sellers" },
      { "title" => "The Sound of Music", "name" => "Julie Andrews" },
      { "title" => "Thoroughly Modern Millie", "name" => "Julie Andrews" },
      { "title" => "Tooth Fairy", "name" => "Dwayne Johnson" },
      { "title" => "Torn Curtain", "name" => "Paul Newman" },
      { "title" => "Victor Victoria", "name" => "Julie Andrews" }
    ])
  end
end

describe "#busiest_john_travolta_years" do
  it "8. List years in which John Travolta made >2 films" do
    expect(busiest_john_travolta_years).to eq([
      { "yr" => 1998, "count" => 3 }
    ])
  end
end

