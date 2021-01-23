Create a new file called base_mutation.rb in apps/graphql/mutations folder. Add this code:

```
module Mutations 
  class BaseMutation < GraphQL::Schema::Mutation 
    null false 
  end 
end
```

Fine, that is out of the way. Let’s create a mutation to add todo. To do this we will create a file called add_todo.rb in the mutations folder and add this code.

```
#app/graphql/mutations/add_todo.rb module Mutations 
  class AddTodo < BaseMutation 
     argument :title, String, required: true 
     argument :description, String, required: true      type Types::TodoType 
     
     def resolve(title: nil, description: nil) 
       Todo.create!(title: title, description: description) 
     rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(e.record.errors.full_messages. join(',')) 
     end 
  end 
end
```

Add the created mutation to mutation type so it will be accessible to the client.

```
# app/graphql/types/mutation_type.rb 
module Types 
  class MutationType < Types::BaseObject 
     field :add_todo, mutation: Mutations::AddTodo 
  end
end
```

Test created mutation

```
mutation { addTodo(title: "New Todo", description: "I will eat rice") { title description } }
```

## Reference 

* [Creating GraphQL in Rails](https://medium.com/@danielshotonwa53/building-an-api-with-graphql-and-rails-8fd6136c50e2)