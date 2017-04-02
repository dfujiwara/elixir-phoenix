
defmodule SupervisedStack.Server do
  @moduledoc """
  Documentation for Stack.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Stack.hello
      :world

  """
  use GenServer

  # Public API
  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, [name: __MODULE__, debug: [:trace]])
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  def push(number) do
    GenServer.cast(__MODULE__, {:push, number})
  end

  # Internal API
  def handle_call(:pop, _, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, num}, state) when num > 100 do
    {:stop, "can't push a big number", state}
  end

  def handle_cast({:push, num}, stack) do
    {:noreply, stack ++ [num]}
  end

  def terminate(reason, state) do
    IO.puts("terminating for #{reason}, with the state of #{state}")
  end

end
