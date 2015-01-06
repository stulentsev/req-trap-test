class TrappedRequest < ActiveRecord::Base

  scope :for_trap, ->(trap_id) { where(trap_id: trap_id) }
  scope :with_id, ->(id) { where(id: id) }

  def params
    JSON.parse(read_attribute('params'))
  rescue
    nil
  end

  def headers
    JSON.parse(read_attribute('headers'))
  rescue
    nil
  end
end
