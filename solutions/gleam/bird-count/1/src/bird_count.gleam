import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [today_count, ..] -> today_count
    [] -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today_count, ..rest] -> [{ today_count + 1 }, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  let istrue = list.count(days, fn(e) { e == 0 })
  istrue > 0
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  list.count(days, fn(e) { e >= 5 })
}
