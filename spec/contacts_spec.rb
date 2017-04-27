require('rspec')
require('contacts')
require('address')
require('pry')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#initialize') do
    it("will let you enter a contact") do
      test_con = Contact.new({:first_name=> 'Bob', :last_name=>'Ross', :job_title=>'painter', :company=>'PBS'})
      expect(test_con.first_name()).to(eq('Bob'))
    end
  end

  describe(".find") do
    it("will allow us to find a single contact by its id") do
      test_con = Contact.new({:first_name=> 'Bob', :last_name=>'Ross', :job_title=>'painter', :company=>'PBS'})
      test_con.save()
      expect(Contact.find(1)).to(eq(test_con))
    end
  end

  describe("#add_address") do
    it("add an address to a contact") do
      test_con = Contact.new({:first_name => 'Bob', :last_name =>'Ross', :job_title =>'painter', :company =>'PBS'})
      test_address = Address.new({:street =>'1800 Easel St.', :city =>'Public TV town', :state =>'WA', :zip =>'98116', :type =>'Home'})
      test_con.add_address(test_address)
      expect(test_con.address()).to(eq([test_address]))
    end
  end
end
