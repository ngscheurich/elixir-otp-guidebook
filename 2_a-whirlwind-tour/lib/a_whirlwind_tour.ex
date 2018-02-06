defmodule AWhirlwindTour do
  # Exercise 2.9.1:
  #
  # 	Implement `sum/1`. This function should take in a list
  # 	of numbers and return the sum of the list.
  def sum(list) do
    Enum.reduce(list, fn(x, acc) -> x + acc end)
  end

  # Exercise 2.9.3a
  #
  # 	Transform `[1,[[2],3]]` to `[9, 4, 1]` with the
  # 	pipe operator. 
  def pipe_transform(list) do
    list
    |> List.flatten()
    |> Enum.reverse()
    |> Enum.map(fn x -> x * x end)
  end

  # Exercise 2.9.3b
  #  
  #	Transform `[1,[[2],3]]` to `[9, 4, 1]` without the
  # 	pipe operator. 
  def transform(list) do
    list = List.flatten(list)
    list = Enum.reverse(list)
    Enum.map(list, fn x -> x * x end)
  end


  # Exercise 2.9.4:
  #
  # 	Translate `crypto:hash(md5, "Tales from the Crypt").`
  # 	from Erlang to Elixir.
  def erlang_to_elixir do
    :crypto.hash(:md5, "Tales from the Crypt")
  end

  # Exercise 2.9.4:
  #
  # 	Take a look at an IPV4 packet. Try writing a parser for it.
  #
  # 	STUDY https://forums.manning.com/posts/list/35976.page	
end
