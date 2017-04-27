class Contact


  attr_reader(:first_name, :last_name, :job_title, :company, :id, :address)
  @@all_contacts = []
  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@all_contacts.length + 1
    @address = []
  end

  define_method(:add_address) do |address|
    @address.push(address)
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:find) do |id|
    found_person = nil
    @@all_contacts.each() do |contact|
      if contact.id().eql?(id)
        found_person = contact
      end
    end
    found_person
  end
end
