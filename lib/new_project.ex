defmodule NewProject do
  _handle_open = fn
    {:ok, file} -> "Read data: #{IO.read(file, :line)}"
    {_, error} -> "Error: #{:file.format_error(error)}"
  end

  _list_concat = fn list1, list2 -> list1 ++ list2 end
  _sum = fn n1, n2, n3 -> n1 + n2 + n3 end
  _pair_tuple_to_list = fn {a, b} -> [a, b] end
end

defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end

fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _ , _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n3 -> n3
end

rem_fizz_buzz = fn n -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

greeter = fn name -> (fn -> "Hello #{name}!" end) end
greet_me = greeter.("Daniele")

prefix = fn first_string -> (fn second_string -> "#{first_string} #{second_string}" end) end
doctor = prefix.("Doctor")

multiply = fn n -> n * 2 end
apply = fn fun, val -> fun.(val) end

IO.puts rem_fizz_buzz.(10)
IO.puts rem_fizz_buzz.(11)
IO.puts rem_fizz_buzz.(12)
IO.puts rem_fizz_buzz.(13)
IO.puts rem_fizz_buzz.(14)
IO.puts rem_fizz_buzz.(15)
IO.puts rem_fizz_buzz.(16)
IO.puts greet_me.()
IO.puts prefix.("Hail").("Satan")
IO.puts doctor.("Daniele")
IO.puts apply.(multiply, 6)

mr_valim = Greeter.for("Jose", "Oi!")

IO.puts mr_valim.("Jose")
IO.puts mr_valim.("Dave")

add_one = &(&1 + 1)
square = &(&1 * &1)
sum_two = &(&1 + &2)
speak = &(IO.puts &1)
_divrem = &{div(&1, &2), rem(&1, &2)}
strings = &"bacon and #{&1}"
match_end = &~r/.*#{&1}$/

IO.puts add_one.(3)
IO.puts square.(5)
IO.puts sum_two.(10, 90)
speak.("SPEAK TO MEEEEEEEEEEEEEEEEEEEEEEEE")
IO.puts strings.("eggs")
match_end.("cat")
