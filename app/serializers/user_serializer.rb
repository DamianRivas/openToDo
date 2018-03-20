class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :first_name, :last_name, :full_name
  
  def full_name
    object.full_name
  end
  
  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
