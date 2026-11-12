import gleeunit
import gleeunit/should
import governance_demo

pub fn main() {
  gleeunit.main()
}

pub fn greeting_test() {
  governance_demo.greeting("Kai")
  |> should.equal("Hello, Kai! Our shared rules live in governance/README.md.")
}
