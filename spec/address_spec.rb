require('rspec')
require('contacts')
require('address')
require('pry')
describe(Address) do
  before() do
    Address.clear()
  end

  describe(".find") do
    it("will allow us to find a single address by its id") do
      test_add = Address.new({:street =>'1800 Easel St.', :city =>'Public TV town', :state =>'WA', :zip =>'98116', :type =>'Home'})
      test_add.save()
      expect(Address.find(1)).to(eq(test_add))
    end
  end

  describe(".all") do
    it("should be an empty array at first") do
      expect(Address.all()).to(eq([]))
    end
  end

end
