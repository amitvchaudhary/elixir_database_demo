defmodule Cart.InvoiceItem do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "invoice_items" do
    belongs_to :invoice, Cart.Invoice, type: :binary_id
    belongs_to :item, Cart.Item, type: :binary_id
    field :quantity, :decimal, precision: 12, scale: 2
    field :price, :decimal, precision: 12, scale: 2
    field :subtotal, :decimal, precision: 12, scale: 2
    timestamps()
  end

  @fields [:item_id, :price, :quantity]
  @zero Decimal.new(0);

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_number(:price, greater_than_or_equal_to: @zero)
    |> validate_number(:quantity, greater_than_or_equal_to: @zero)
    |> foreign_key_constraint(:invoice_id, message: "Select a valid invoice")
    |> foreign_key_constraint(:item_id, message: "Select a valid invoice")
    |> set_subtotal
  end

  def set_subtotal(cs) do
    case {(cs.changes[:price] || cs.changes.price), (cs.changes[:quantity] || cs.changes.quantity)} do
      {_price, nil} -> cs
      {nil, _quantity} -> cs
      {price, quantity} ->
        put_change(cs, :subtotal, Decimal.mult(price, quantity))
    end
  end

end
