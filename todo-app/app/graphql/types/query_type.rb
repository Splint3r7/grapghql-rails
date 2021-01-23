module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"


    field :all_todos, [TodoType], null: false, 
      description: "Returns all todos" 
    
    def test_field
      "Hello World!"
    end

    def all_todos 
      Todo.all 
    end

  end
end
