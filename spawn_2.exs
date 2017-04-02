defmodule SpawnLink do
  def message_parent(sender) do
    send(sender, "hi")

    exit(:bad)
    #raise("bad")
  end
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(SpawnLink, :message_parent, [self()])
    :timer.sleep 500
    receive do
      message -> IO.puts("Receive message: #{message}")
    end
  end
end

defmodule SpawnMonitor do
  def message_parent(sender) do
    send(sender, "hi")
    exit(:bad)
    #raise("bad")
  end
  def run do
    Process.flag(:trap_exit, true)
    spawn_monitor(SpawnMonitor, :message_parent, [self()])
    :timer.sleep 500
    receive do
      message -> IO.puts("Receive message: #{message}")
    end
  end

end
