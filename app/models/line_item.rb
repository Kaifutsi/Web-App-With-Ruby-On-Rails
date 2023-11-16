class LineItem < ApplicationRecord
  belongs_to :manicure
  belongs_to :cart
end
