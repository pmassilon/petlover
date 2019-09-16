require 'rails_helper'

RSpec.describe Pets::BaseService do
  describe 'can_had?' do
    it 'Permite cadastrar' do
      person = create(:person)
      pet = build(:pet, person: person)

      response = Pets::BaseService.new.can_had?(person, pet)

      expect(response.success?).to eq true
      expect(response.message).to eq 'Pode registrar o Pet'
    end

    describe 'espera exception' do
      it 'quando Pessoa não pode ter mais Pets porque já possui custo mensal maior que 1000.00' do
        person = create(:person)
        create(:pet, person: person, monthly_cost: 1_000.01)
        pet = build(:pet, person: person, monthly_cost: nil)

        response = Pets::BaseService.new.can_had?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não cadastrar mais Pets, seu custo mensal já é maior que R$ 1.000,00."
      end

      it 'quando Pessoa não pode ter Gatos' do
        person = create(:person, full_name: 'Agnês Solusa')
        pet = build(:pet, kind: :cat, person: person)

        response = Pets::BaseService.new.can_had?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não pode ter um Gato."
      end

      it 'quando Pessoa não pode ter Andorinhas' do
        person = create(:person, birthdate: '01/01/2018')
        pet = build(:pet, kind: :swallow, person: person)

        response = Pets::BaseService.new.can_had?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não pode ter uma Andorinha."
      end
    end
  end

  describe 'can_change?' do
    it 'criado com sucesso' do
      person = create(:person)
      pet = create(:pet, person: person)

      response = Pets::BaseService.new.can_change?(person, pet)

      expect(response.success?).to eq true
      expect(response.message).to eq 'Pode atualizar o Pet'
    end

    describe 'espera exception' do
      it 'quando Pessoa não pode ter mais Pets porque já possui custo mensal maior que 1000.00' do
        person = create(:person)
        pet = create(:pet, person: person, monthly_cost: 1_000.01)
        pet.monthly_cost = 2_000.01

        response = Pets::BaseService.new.can_change?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não aumentar o custo mensal do seu Pet, seu custo mensal já é maior que R$ 1.000,00."
      end

      it 'quando Pessoa não pode ter Gatos' do
        person = create(:person, full_name: 'Agnês Solusa')
        pet = create(:pet, kind: :dog, person: person)
        pet.kind = :cat

        response = Pets::BaseService.new.can_change?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não pode ter um Gato."
      end

      it 'quando Pessoa não pode ter Andorinhas' do
        person = create(:person, birthdate: '01/01/2018')
        pet = create(:pet, kind: :dog, person: person)
        pet.kind = :swallow

        response = Pets::BaseService.new.can_change?(person, pet)

        expect(response.success?).to eq false
        expect(response.message).to eq "Desculpe mas você não pode ter uma Andorinha."
      end
    end
  end
end
