defmodule ConwayTest do
  use ExUnit.Case

  test "nothing", do: assert true

  # test "alive dies with 2"       , do: refute Conway.next_state(true, 2)
  # test "alive stays alive with 3", do: assert Conway.next_state(true, 3)
  # test "alive stays alive with 4", do: assert Conway.next_state(true, 4)
  # test "alive dies with 5"       , do: refute Conway.next_state(true, 5)

  # test "dead stays dead with 2" , do: refute Conway.next_state(false, 2)
  # test "dead comes alive with 3", do: assert Conway.next_state(false, 3)
  # test "dead stays dead with 4" , do: refute Conway.next_state(false, 4)
end
