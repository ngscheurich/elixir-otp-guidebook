defmodule Cache do
  use GenServer

  @name CacheServer

  ## Client API
 
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CacheServer])
  end

  def write(key, value) do
    GenServer.call(@name, {:write, key, value})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.call(@name, {:delete, key})
  end

  def exist?(key) do
    GenServer.call(@name, {:exist?, key})
  end

  def clear do
    GenServer.call(@name, :clear)
  end

  def stop do
    GenServer.cast(@name, :stop)
  end
  
  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, key, value}, _from, state) do
    case Map.has_key?(state, key) do
      true ->
        {:reply, "#{inspect(key)} already exists", state}
      false ->
        {:reply, "Added #{inspect(key)}", Map.put_new(state, key, value)}
    end
  end

  def handle_call({:read, key}, _from, state) do
    case Map.has_key?(state, key) do
      true ->
        {:reply, state[key], state}
      false ->
        {:reply, "#{inspect(key)} does not exist", state}
    end
  end

  def handle_call({:exist?, key}, _from, state) do
    {:reply, Map.has_key?(state, key), state}
  end

  def handle_call({:delete, key}, _from, state) do
    {:reply, "Deleted #{inspect(key)}", Map.drop(state, [key])}
  end

  def handle_call(:clear, _from, state) do
    {:reply, "Cleared state", %{}}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  def terminate(reason, state) do
    IO.puts("Server terminated -- #{inspect(reason)}")
    inspect(state)
    :ok
  end
end
