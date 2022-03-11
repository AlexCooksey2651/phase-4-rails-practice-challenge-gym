class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :id, :gym_id, :client_id, :charge, :total_membership_charge

  def total_membership_charge
    self.object.memberships.sum(:charge)
  end
end
