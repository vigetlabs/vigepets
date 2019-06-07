defmodule VigepetsWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(VigepetsWeb.Schema.AnimalTypes)
  import_types(VigepetsWeb.Schema.WoofTypes)

  query do
    import_fields(:animal_queries)
    import_fields(:woof_queries)
  end

  mutation do
    import_fields(:animal_mutations)
    import_fields(:woof_mutations)
  end

  subscription do
    import_fields(:animal_subscriptions)
    import_fields(:woof_subscriptions)
  end
end
