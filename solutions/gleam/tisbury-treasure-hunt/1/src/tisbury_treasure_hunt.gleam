import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(x, y) = place_location

  #(y, x)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  let #(x, y) = place_location_to_treasure_location(place_location)
  let #(a, b) = treasure_location

  a == x && b == y
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, b) = place

  list.count(treasures, fn(a) { a.1 == place_location_to_treasure_location(b) })
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(a, _) = found_treasure
  let #(c, _) = place
  let #(e, _) = desired_treasure

  // if A == "The Brass Spyglass"
  // AND if C == "Abandoned Lighthouse"
  // return True
  let case_1 = {
    a == "The Brass Spyglass" && c == "Abandoned Lighthouse"
  }

  // if A == "Amethyst Octopus"
  // AND if C == "Stormy Breakwater"
  // AND (if E == "Crystal Crab" OR if E == "Glass Starfish")
  // return True

  let case_2 = {
    a == "Amethyst Octopus"
    && c == "Stormy Breakwater"
    && { e == "Crystal Crab" || e == "Glass Starfish" }
  }

  // if A == "Vintage Pirate Hat"
  // AND if C == "Harbor Managers Office"
  // AND (if E == "Model Ship in Large Bottle" OR if E == "Antique Glass Fishnet Float")
  // return True

  let case_3 = {
    a == "Vintage Pirate Hat"
    && c == "Harbor Managers Office"
    && {
      e == "Model Ship in Large Bottle" || e == "Antique Glass Fishnet Float"
    }
  }

  case_1 || case_2 || case_3
}
