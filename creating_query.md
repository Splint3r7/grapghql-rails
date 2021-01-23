

```
$ rails generate model Todo title:string description:text
```

Navigate to models/todos.rb and add rails validation.

```
class Todo < ApplicationRecord 
   validates :title, presence: true 
   validates :description, presence: true 
end
```

Run migration

```
rails db:migrate
```

Adding data in database

```
$ rails console 

then add data with

Todo.create(title: 'Sample title', description: 'Sample Description')
```

Create a new type for todos by creating a new file: app/graphql/types/todo_type.rb.

```
#app/graphql/types/todo_type.rb
module Types 
  class TodoType < Types::BaseObject 
    field :title, String, null: false 
    field :description, String, null: false 
  end 
end
```

The next step is to create a query type that will be used to get all todos. Go to app/graphql/types/query_type.rb. Add a new field to the query type. :all_todos to get all our todos.

```
# app/graphql/types/query_typefield :all_todos, [TodoType], null: false, description: "Returns all todos" def all_todos 
  Todo.all 
end
```

Open your rails server

```
http://127.0.0.1:3000/graphiql
```

Query your data

```
{
  allTodos {
    title
    description
  }
}

```

Response will be

```
{
  "data": {
    "allTodos": [
      {
        "title": "IamTitle",
        "description": "this is users description"
      },
      {
        "title": "IamTitle 2",
        "description": "this is users description 2"
      }
    ]
  }
}
```