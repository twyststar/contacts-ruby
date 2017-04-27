require('pry')
require('launchy')
require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/address')
also_reload('./**/*.rb')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  @first_name = params.fetch('first-name')
  @last_name = params.fetch('last-name')
  @job = params.fetch('job')
  @company = params.fetch('company')
  @contact = Contact.new({:first_name=> @first_name, :last_name=>@last_name, :job_title=>@job, :company=>@company})
  @contact.save()
  @contacts = Contact.all()
  erb(:success)
end

get('/single_contact/:id') do
  @contact = Contact.find(params.fetch("id").to_i)
  erb(:single_contact)
end

post('/single_contact') do
  @type = params.fetch('type')
  @street = params.fetch('street')
  @city = params.fetch('city')
  @state = params.fetch('state')
  @zip = params.fetch('zip')
  @address = Address.new({:type=> @type, :street=>@street, :city=>@city, :state=>@state, :zip=>@zip})
  @address.save()
  @contact = Contact.find(params.fetch("contact_id").to_i())
  @contact.add_address(@address)

  erb(:success)
end

get('/single_address/:id') do
  @addresses = Address.find(params.fetch("id").to_i())
  erb(:single_address)
end
