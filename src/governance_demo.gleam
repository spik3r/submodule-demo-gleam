import gleam/io

pub fn greeting(name: String) -> String {
  "Hello, " <> name <> "! Our shared rules live in governance/README.md."
}

pub fn main() {
  io.println(greeting("submodule explorer"))
}
