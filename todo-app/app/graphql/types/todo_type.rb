module Types 
  class TodoType < Types::BaseObject 
    field :title, String, null: false 
    field :description, String, null: false 
  end 
end