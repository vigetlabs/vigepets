defmodule VigepetsWeb.SubscriptionCase do
    use ExUnit.CaseTemplate

    using do
      quote do
        use VigepetsWeb.ChannelCase
        use Absinthe.Phoenix.SubscriptionTest, schema: VigepetsWeb.Schema
        use ExSpec
        import Vigepets.Factory

        setup do
        #   pupper = insert(:pupper)

          # When connecting to a socket, if you pass a token we will set the context's `current_user`
        #   params = %{
        #     "token" => sign_auth_token(user)
        #   }

          {:ok, socket} = Phoenix.ChannelTest.connect(VigepetsWeb.AbsintheSocket, nil)#, params)
          {:ok, socket} = Absinthe.Phoenix.SubscriptionTest.join_absinthe(socket)

          {:ok, socket: socket}#, user: user}
        end

        # defp sign_auth_token(user) do
        #   {:ok, token, _claims} = Guardian.encode_and_sign(user)
        #   token
        # end
      end
    end
  end
