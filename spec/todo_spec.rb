require('rspec')
require('todo')
require('pry')

describe(ToDo) do
  describe('#description') do
    it("will let you enter a string") do
      test_todo = ToDo.new("a string")
      expect(test_todo.description()).to(eq("a string"))  
    end
  end
end
