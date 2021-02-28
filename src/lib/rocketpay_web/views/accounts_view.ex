defmodule RocketpayWeb.AccountsView do

  alias Rocketpay.Account

  def render("update.json", %{account: %Account{id: id, user_id: user_id, balance: balance}}) do
    %{
      message: "Account updated",
      account: %{
        id: id,
        user_id: user_id,
        balance: balance,
      }
    }
  end
end
