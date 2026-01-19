import gleam/string

pub fn first_letter(name: String) -> String {
  case string.first(string.trim(name)) {
    Ok(rest) -> rest
    _ -> ""
  }
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  let name_list = string.split(full_name, " ")

  case name_list {
    [first, last] -> {
      let a =
        first
        |> initial

      let b =
        last
        |> initial

      a <> " " <> b
    }
    _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let first_half =
    "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
"

  let second_half =
    "**     "
    <> initials(full_name1)
    <> "  +  "
    <> initials(full_name2)
    <> "     **"

  let third_half =
    "
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"

  first_half <> second_half <> third_half
}
