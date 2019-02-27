defmodule Esviewing.Event do
  defmodule ViewingBooked do
    @derive Jason.Encoder
    defstruct [:id, :buyer_id, :confirmed_with_seller, :property_id, :start_time]
  end

  defmodule ViewingCancelled do
    @derive Jason.Encoder
    defstruct [:id]
  end

  defmodule ViewingConfirmedWithSeller do
    @derive Jason.Encoder
    defstruct [:id]
  end

  defmodule ViewingFeedbackAdded do
    @derive Jason.Encoder
    defstruct [:id, :feedback]
  end

  defmodule ViewingRearranged do
    @derive Jason.Encoder
    defstruct [:id, :start_time]
  end
end
