defmodule PingPong do
  def ping do
    receive do
      {sender_pid, :pong} ->
        IO.puts("pong!")
        :timer.sleep(1000)
        send(sender_pid, {self, :ping})
      _ ->
        IO.puts("I only accept pongs.")
    end
    ping
  end

  def pong do
    receive do
      {sender_pid, :ping} ->
        IO.puts("ping!")
        :timer.sleep(1000)
        send(sender_pid, {self, :pong})
      _ ->
        IO.puts("I only accept pings.")
    end
    pong
  end

  def start do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    {ping_pid, pong_pid}
  end
end
