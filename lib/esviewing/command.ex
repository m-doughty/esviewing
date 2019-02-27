defmodule Esviewing.Command do
  defmodule AddViewingFeedback do
    defstruct [:id, :feedback]
  end

  defmodule BookViewing do
    defstruct [:id, :buyer_id, :confirmed_with_seller, :property_id, :start_time]
  end

  defmodule CancelViewing do
    defstruct [:id]
  end

  defmodule ConfirmViewingWithSeller do
    defstruct [:id]
  end

  defmodule RearrangeViewing do
    defstruct [:id, :start_time]
  end
end
