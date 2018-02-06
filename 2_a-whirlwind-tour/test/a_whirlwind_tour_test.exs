defmodule AWhirlwindTourTest do
  use ExUnit.Case
  doctest AWhirlwindTour

  describe "sum/1" do
    test "returns the sum of a list" do
      assert AWhirlwindTour.sum([1, 2, 3]) == 6
    end
  end

  describe "pipe_transform/1" do
    test "flattens the list, reverses it, and squares each member" do
      assert AWhirlwindTour.pipe_transform([1, [[2], 3]]) == [9, 4, 1]
    end
  end

  describe "transform/1" do
    test "flattens the list, reverses it, and squares each member" do
      assert AWhirlwindTour.transform([1, [[2], 3]]) == [9, 4, 1]
    end
  end

  describe "erlang_to_elixir/1" do
    test "returns the correct digest value" do
      digest = <<79, 132, 235, 77, 3, 224, 121, 88, 98, 75, 61, 67, 62, 16, 233, 91>>
      assert AWhirlwindTour.erlang_to_elixir() == digest
    end
  end
end
