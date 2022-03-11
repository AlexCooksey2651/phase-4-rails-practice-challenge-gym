class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_membership_charge

  def total_membership_charge
    self.object.memberships.sum(:charge)
  end
end
