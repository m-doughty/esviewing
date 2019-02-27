defmodule Esviewing.ViewingRouter do
  use Commanded.Commands.Router

  alias Esviewing.Aggregate.Viewing

  alias Esviewing.Command.{
    AddViewingFeedback,
    BookViewing,
    CancelViewing,
    ConfirmViewingWithSeller,
    RearrangeViewing
  }

  dispatch(
    [
      AddViewingFeedback,
      BookViewing,
      CancelViewing,
      ConfirmViewingWithSeller,
      RearrangeViewing
    ],
    to: Viewing,
    identity: :id
  )
end
