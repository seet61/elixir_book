defmodule Todo.CacheTest do
  use ExUnit.Case

  test "cache init" do
    {:ok, cache} = Todo.Cache.start()
    IO.inspect(cache)

    assert cache != nil

    alice = Todo.Cache.server_process(cache, "Alice's list")
    IO.inspect(alice)
    assert alice != nil

    bob1 = Todo.Cache.server_process(cache, "Bob's list")
    IO.inspect(bob1)
    bob2 = Todo.Cache.server_process(cache, "Bob's list")
    IO.inspect(bob1)

    assert bob1 == bob2
  end

  test "check cached process" do
    {:ok, cache} = Todo.Cache.start()
    IO.inspect(cache)

    bobs = Todo.Cache.server_process(cache, "Bob's list")
    Todo.Server.add_entry(bobs, %{date: ~D[2018-12-19], title: "Dentist"})
    bob_list = Todo.Server.entries(bobs, ~D[2018-12-19])

    assert [%{date: ~D[2018-12-19], id: 1, title: "Dentist"}] == bob_list

    alice_list = Todo.Cache.server_process(cache, "Alice's list")
      |> Todo.Server.entries(~D[2018-12-19])

    assert [] == alice_list
  end


  test "100_000 cached processes" do
    {:ok, cache} = Todo.Cache.start()

    start_count = :erlang.system_info(:process_count)
    IO.inspect(start_count)

    Enum.each(
      1..100_00,
      fn item ->
        Todo.Cache.server_process(cache, "list #{item}")
      end
    )

    end_count = :erlang.system_info(:process_count)
    IO.inspect(end_count)

    assert start_count != end_count
  end
end
