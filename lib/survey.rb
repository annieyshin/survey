class Survey < ActiveRecord::Base
  belongs_to(:question)
end
