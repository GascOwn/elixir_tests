defmodule NewProjectTest do
  use ExUnit.Case
  doctest NewProject

  test "greets the world" do
    assert NewProject.hello() == :world
  end
end
