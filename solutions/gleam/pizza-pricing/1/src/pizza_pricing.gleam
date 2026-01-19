// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(rest) -> pizza_price(rest) + 1
    ExtraToppings(rest) -> pizza_price(rest) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [first] -> {
      pizza_price(first) + 3
    }
    [first, second] -> {
      pizza_price(first) + pizza_price(second) + 2
    }
    _ -> calculate_order(order, 0)
  }
}

fn calculate_order(order: List(Pizza), accumulator: Int) -> Int {
  case order {
    [] -> accumulator
    [first, ..rest] -> {
      let accumulator = accumulator + pizza_price(first)
      calculate_order(rest, accumulator)
    }
  }
}
