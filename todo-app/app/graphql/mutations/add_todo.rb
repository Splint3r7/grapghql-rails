module Mutations 
  class AddTodo < BaseMutation 
     
     argument :title, String, required: true 
     argument :description, String, required: true      

     type Types::TodoType 
     
     def resolve(title: nil, description: nil) 
       Todo.create!(title: title, description: description) 
     
     rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(e.record.errors.full_messages. join(',')) 
     end 
  end 
end