defmodule VigepetsWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(VigepetsWeb.Schema.AnimalTypes)

  query do
    import_fields(:animal_queries)
  end

  mutation do
    import_fields(:animal_mutations)
  end

  subscription do
    import_fields(:animal_subscriptions)
  end
end
