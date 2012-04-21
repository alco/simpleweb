defmodule SimpleWeb do
  defmacro __using__(module, opts // []) do
    IO.puts module
    IO.inspect opts
  end
end
