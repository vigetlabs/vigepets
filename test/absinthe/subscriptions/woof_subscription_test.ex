defmodule VigepetsWeb.WoofSubscriptionsTest do
    use VigepetsWeb.SubscriptionCase
  
    describe "Woof subscription" do
      it "updates on new woof", %{socket: socket} do
        # Query to establish the subscription.
        subscription_query = """
          subscription {
            woofCreated {
              id
              body
            }
          }
        """
  
        # Push the query onto the socket.
        ref = push_doc(socket, subscription_query)
  
        # Assert that the subscription was successfully created.
        assert_reply(ref, :ok, %{subscriptionId: _subscription_id})
  
        # Query to create a new woof to invoke the subscription.
        create_woof_mutation = """
          mutation CreateWoof {
            createWoof(body: "Big discussion") {
              id
              body
            }
          }
        """
  
        # Push the mutation onto the socket.
        ref =
          push_doc(
            socket,
            create_woof_mutation
          )
  
        # Assert that the mutation successfully created the woof.
        assert_reply(ref, :ok, reply)
        data = reply.data["createWoof"]
        assert data["body"] == "Big discussion"
  
        # Assert that the subscription notified us of the new woof.
        assert_push("subscription:data", push)
        data = push.result.data["woofCreated"]
        assert data["body"] == "Big discussion"
      end
    end
  end