class NoteSerializer < ActiveModel::Serializer
  attributes :id,:formula_note,:simple_note,:created_at,:updated_at

  has_many :photos
  has_many :products
  # has_many :shared_logs

end
