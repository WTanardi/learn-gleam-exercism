import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let conv_left = case left {
    Celsius(left) -> left
    Fahrenheit(left) -> fahrenheit_to_celsius(left)
  }

  let conv_right = case right {
    Celsius(right) -> right
    Fahrenheit(right) -> fahrenheit_to_celsius(right)
  }

  float.compare(conv_left, conv_right)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: fn(city_a, city_b) {
    compare_temperature(city_a.temperature, city_b.temperature)
  })
}
