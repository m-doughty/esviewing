defmodule Esviewing.Aggregate.Viewing do
  @derive Jason.Encoder
  defstruct [
    :id,
    :buyer_id,
    :cancelled,
    :confirmed_with_seller,
    :feedback,
    :property_id,
    :start_time
  ]

  alias __MODULE__

  alias Esviewing.Command.{
    AddViewingFeedback,
    BookViewing,
    CancelViewing,
    ConfirmViewingWithSeller,
    RearrangeViewing
  }

  alias Esviewing.Event.{
    ViewingBooked,
    ViewingCancelled,
    ViewingConfirmedWithSeller,
    ViewingFeedbackAdded,
    ViewingRearranged
  }

  def execute(%Viewing{id: id}, %AddViewingFeedback{feedback: feedback}) do
    %ViewingFeedbackAdded{id: id, feedback: feedback}
  end

  def execute(%Viewing{id: nil}, %BookViewing{
        id: id,
        buyer_id: buyer_id,
        confirmed_with_seller: confirmed_with_seller,
        property_id: property_id,
        start_time: start_time
      }) do
    %ViewingBooked{
      id: id,
      buyer_id: buyer_id,
      confirmed_with_seller: confirmed_with_seller,
      property_id: property_id,
      start_time: start_time
    }
  end

  def execute(%Viewing{id: id}, %CancelViewing{}) do
    %ViewingCancelled{id: id}
  end

  def execute(%Viewing{id: id}, %ConfirmViewingWithSeller{}) do
    %ViewingConfirmedWithSeller{id: id}
  end

  def execute(%Viewing{id: id}, %RearrangeViewing{start_time: start_time}) do
    %ViewingRearranged{id: id, start_time: start_time}
  end

  def apply(%Viewing{}, %ViewingBooked{
        id: id,
        buyer_id: buyer_id,
        confirmed_with_seller: confirmed_with_seller,
        property_id: property_id,
        start_time: start_time
      }) do
    v = %Viewing{
      id: id,
      buyer_id: buyer_id,
      confirmed_with_seller: confirmed_with_seller,
      property_id: property_id,
      start_time: start_time
    }

    IO.inspect(v)
    v
  end

  def apply(%Viewing{} = viewing, %ViewingCancelled{}) do
    v = %Viewing{viewing | cancelled: true}

    IO.inspect(v)
    v
  end

  def apply(%Viewing{} = viewing, %ViewingConfirmedWithSeller{}) do
    v = %Viewing{viewing | confirmed_with_seller: true}

    IO.inspect(v)
    v
  end

  def apply(%Viewing{} = viewing, %ViewingFeedbackAdded{feedback: feedback}) do
    v = %Viewing{viewing | feedback: feedback}

    IO.inspect(v)
    v
  end

  def apply(%Viewing{} = viewing, %ViewingRearranged{start_time: start_time}) do
    v = %Viewing{viewing | start_time: start_time}

    IO.inspect(v)
    v
  end
end
