defmodule Vigepets.AbsintheHelpers do
  def query_skeleton(query, query_name) do
    %{
      "operationName" => "#{query_name}",
      "query" => "query #{query_name} #{query}",
      "variables" => "{}"
    }
  end

  def mutation_skeleton(query) do
    %{
      "operationName" => "",
      "query" => "mutation #{query}",
      "variables" => ""
    }
  end
end
