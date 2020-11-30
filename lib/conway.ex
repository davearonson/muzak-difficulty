defmodule Conway do
  # def next_state(alive, neighbors) do
  #   if alive do
  #     neighbors in [3,4]
  #   else
  #     neighbors == 3
  #   end
  # end

  # this is the more elixirish way to do it but creates no mutants!
  def next_state(true, n) when n in [3,4], do: true
  def next_state(true, _), do: false
  def next_state(false, 3), do: true
  def next_state(false, _), do: false
end
