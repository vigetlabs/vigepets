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
alias Vigepets.Sniffs
alias Vigepets.Sniffs.Sniff
alias Vigepets.Woofs
alias Vigepets.Woofs.Woof
alias Vigepets.Subwoofs
alias Vigepets.Subwoofs.Subwoof
alias Vigepets.Reactions.Lick

Faker.start()

###### Number to generate for each model ######
num_puppers = 10            # total number of puppers
max_num_woofs = 10          # maximum number of woofs / pupper
max_num_subwoofs = 10        # maximum number of subwoofs / woof

###### Puppers ######
# Generate n puppers
Enum.each(0..num_puppers, fn(pupper_id) -> 
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
# Generates a random number of woofs for each pupper
Enum.each(Animals.list_puppers, fn(pupper) -> 
    Enum.each 0..Enum.random(0..max_num_woofs), fn woof -> 
        Repo.insert! %Woof{
            # Other shakespeare play options: https://hexdocs.pm/faker/Faker.Lorem.Shakespeare.html
            body: Faker.Lorem.Shakespeare.as_you_like_it(),
            pupper_id: pupper.id
        }   
    end
end)

#Generate subwoofs and licks for each woof
Enum.each(Woofs.list_woofs, fn(woof) -> 
    # Generates a random number of subwoofs/comments (between 0..5) for each woof
    Enum.each 0..Enum.random(0..max_num_subwoofs), fn x -> 
        Repo.insert! %Subwoof{
            body: Faker.Lorem.Shakespeare.hamlet(),
            woof_id: woof.id,
            pupper_id: Enum.random(Animals.list_puppers).id
        } 
    end

    # Generated a random number of licks per woof from a random set of puppers
    Enum.each(Enum.take_random(Animals.list_puppers, Enum.random(1..Kernel.length(Animals.list_puppers))), fn pupper -> 
        Repo.insert! %Lick{
            woof_id: woof.id,
            pupper_id: pupper.id
        } 
    end)
end)


