class Item < ApplicationRecord
  belongs_to :list


  def complete?
    self.status == STATUS[:complete]
  end

  def incomplete?
    self.status == STATUS[:incomplete]
  end

end
