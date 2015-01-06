class TrappedRequest < ActiveRecord::Base

  scope :for_trap, ->(trap_id) { where(trap_id: trap_id) }
end
