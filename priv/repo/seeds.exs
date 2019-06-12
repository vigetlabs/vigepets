# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Vigepets.Repo.insert!(%Vigepets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Vigepets.Repo
alias Vigepets.Animals
alias Vigepets.Animals.Pupper
alias Vigepets.Sniffs.Sniff

Faker.start()

###### Puppers ######
# Generate 10 puppers
Enum.each(0..10, fn(pupper_id) -> 
    Repo.insert! %Pupper{
        name: Faker.Cat.name(),
        age: Faker.Random.Elixir.random_between(1,12),
        owner_name: Faker.Name.first_name(),
        avatar_url: Faker.Avatar.image_url(),
        favorite_toy: Faker.Commerce.product_name()
    }
end)

###### Sniffs ######
# Generate sniffs. First pupper doesn't sniff anyone. Second pupper sniffs 1 pupper. 
# Third pupper sniffs 2 puppers, and so on. Last pupper sniffs every other pupper
# Gives us some variability is # of sniffs / pupper.
Enum.each(Animals.list_puppers, fn(sniffer) -> 
    Enum.each 1..sniffer.id, fn sniffed_id -> 
        if (sniffer.id != sniffed_id) do
            Repo.insert! %Sniff{
                follower_id: sniffer.id,
                followed_id: sniffed_id
            }   
        else 
        end
    end
end)

###### Woofs, Subwoofs, Licks ######
