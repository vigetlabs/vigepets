defmodule Vigepets.Factory do
  use ExMachina.Ecto, repo: Vigepets.Repo

  def pupper_factory do
    %Vigepets.Animals.Pupper{
      name: "Ace",
      owner_name: "Sol",
      age: 10,
      avatar_url: nil,
      favorite_toy: "Ball"
    }
  end

  def woof_factory do
    body = sequence(:body, &"Woof! (Part #{&1})")

    %Vigepets.Woofs.Woof{
      body: body,
      pupper: build(:pupper),
    }
  end
end
