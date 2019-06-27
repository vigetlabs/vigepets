defmodule VigepetsWeb.SubscriptionCase do
    use ExUnit.CaseTemplate

    using do
      quote do
        use VigepetsWeb.ChannelCase
        use Absinthe.Phoenix.SubscriptionTest, schema: VigepetsWeb.Schema
        use ExSpec
        import Vigepets.Factory

        setup do
          {:ok, socket} = Phoenix.ChannelTest.connect(VigepetsWeb.AbsintheSocket, nil)#, params)
          {:ok, socket} = Absinthe.Phoenix.SubscriptionTest.join_absinthe(socket)

          {:ok, socket: socket}#, user: user}
        end
        
      end
    end
  end
