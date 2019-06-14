defmodule VigepetsWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(VigepetsWeb.Schema.AnimalTypes)
  import_types(VigepetsWeb.Schema.WoofTypes)
  import_types(VigepetsWeb.Schema.SubwoofTypes)

  query do
    import_fields(:animal_queries)
    import_fields(:woof_queries)
    import_fields(:subwoof_queries)
  end

  mutation do
    import_fields(:animal_mutations)
    import_fields(:woof_mutations)
    # import_fields(:subwoof_mutations)
  end

  subscription do
    import_fields(:animal_subscriptions)
    import_fields(:woof_subscriptions)
    # import_fields(:subwoof_subscriptions)
  end
end
