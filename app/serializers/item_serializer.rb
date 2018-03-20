class ItemSerializer < ActiveModel::Serializer
  attributes :id, :body, :completed
  
  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
