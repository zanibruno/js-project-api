class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :quantity, :trip_id
end
