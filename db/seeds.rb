# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Jhonny Cash
jhonny = Person.find_or_create_by(email: 'jhonny_cash@petlover.com') do |person|
  person.full_name = 'Jhonny Cash'
  person.document = CPF.generate
  person.birthdate = Date.parse('26/02/1932')
  person.email = 'jhonny_cash@petlover.com'
  person.password = 'password'
end
jhonny.confirm

jhonny.pets.find_or_create_by(name: 'Pé de Pano', kind: :horse) do |animal|
  animal.name = 'Pé de Pano'
  animal.monthly_cost = 199.99
  animal.kind = :horse
end

# Sid Vicious
sid = Person.find_or_create_by(email: 'sid_vicious@petlover.com') do |person|
  person.full_name = 'Sid Vicious'
  person.document = CPF.generate
  person.birthdate = Date.parse('10/05/1957')
  person.email = 'sid_vicious@petlover.com'
  person.password = 'password'
end
sid.confirm

sid.pets.find_or_create_by(name: 'Rex', kind: :dog) do |animal|
  animal.name = 'Rex'
  animal.monthly_cost = 99.99
  animal.kind = :dog
end

# Axl Rose
axl = Person.find_or_create_by(email: 'axl_rose@petlover.com') do |person|
  person.full_name = 'Axl Rose'
  person.document = CPF.generate
  person.birthdate = Date.parse('06/02/1962')
  person.email = 'axl_rose@petlover.com'
  person.password = 'password'
end
axl.confirm

axl.pets.find_or_create_by(name: 'Ajudante do Papai Noel', kind: :dog) do |animal|
  animal.name = 'Ajudante doPapai Noel',
  animal.monthly_cost = 99.99
  animal.kind = :dog
end

# Joey Ramone
joey = Person.find_or_create_by(email: 'joey_ramone@petlover.com') do |person|
  person.full_name = 'Joey Ramone'
  person.document = CPF.generate
  person.birthdate = Date.parse('19/05/1951')
  person.email = 'joey_ramone@petlover.com'
  person.password = 'password'
end
joey.confirm

joey.pets.find_or_create_by(name: 'Rex', kind: :parrot) do |animal|
  animal.name = 'Rex'
  animal.monthly_cost = 103.99
  animal.kind = :parrot
end

# Bruce Dickinson
bruce = Person.find_or_create_by(email: 'bruce_dickinson@petlover.com') do |person|
  person.full_name = 'Bruce Dickinson'
  person.document = CPF.generate
  person.birthdate = Date.parse('07/08/1958')
  person.email = 'bruce_dickinson@petlover.com'
  person.password = 'password'
end
bruce.confirm

bruce.pets.find_or_create_by(name: 'Flora', kind: :llama) do |animal|
  animal.name = 'Flora'
  animal.monthly_cost = 103.99
  animal.kind = :llama
end

# Kurt Cobain
kurt = Person.find_or_create_by(email: 'kurt_cobain@petlover.com') do |person|
  person.full_name = 'Kurt Cobain'
  person.document = CPF.generate
  person.birthdate = Date.parse('20/02/1967')
  person.email = 'kurt_cobain@petlover.com'
  person.password = 'password'
end
kurt.confirm

kurt.pets.find_or_create_by(name: 'Dino', kind: :iguana) do |animal|
  animal.name = 'Dino'
  animal.monthly_cost = 177.99
  animal.kind = :iguana
end

# Elvis Presley
elvis = Person.find_or_create_by(email: 'elvis_presley@petlover.com') do |person|
  person.full_name = 'Elvis Presley'
  person.document = CPF.generate
  person.birthdate = Date.parse('17/08/2008')
  person.email = 'elvis_presley@petlover.com'
  person.password = 'password'
end
elvis.confirm

elvis.pets.find_or_create_by(name: 'Lassie', kind: :platypus) do |animal|
  animal.name = 'Lassie'
  animal.monthly_cost = 407.99
  animal.kind = :platypus
end
