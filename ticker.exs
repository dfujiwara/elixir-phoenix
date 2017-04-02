defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients) do
    receive do
      {:register, pid} ->
        IO.puts("registering #{inspect pid}")
        generator(clients ++ [pid])
        #generator([pid | clients])
    after
      @interval ->
        IO.puts("tick")
        # Enum.each(clients, fn(client) -> send(client, {:tick}) end)
        case clients do
          [head | tail] -> send(head, {:tick})
            generator(tail ++ [head])
          _ -> generator(clients)
        end
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver() do
    receive do
      {:tick} ->
        IO.puts("tock in client")
        receiver()
    end
  end
end

defmodule RingClient do
  def setup() do
    :global.register_name(Node.self, :erlang.group_leader())
    pid = spawn(__MODULE__, :receiver, [] )
  end

  def start() do
    send
  end

  def receiver() do
    receive do
      {:next, names} ->
        IO.puts("tick tock in client: #{Node.self}")
        [head | tail] = names
        next_pid = :global.whereis_name(head)
        send(next_pid, {:next, tails ++ [head]} )
    end
  end

end
