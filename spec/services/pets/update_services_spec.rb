require 'rails_helper'

RSpec.describe Pets::UpdateService do
  it 'criado com sucesso' do
    person = create(:person)
    pet = create(:pet, person: person)
    params = pet.attributes.symbolize_keys

    response = Pets::UpdateService.new(pet, params).call

    expect(response.success?).to eq true
    expect(response.message).to eq "O Pet #{params[:name].titleize} foi atualizado."
  end

  describe 'espera exception' do
    it 'quando não Pet' do
      params = attributes_for(:pet)

      response = Pets::UpdateService.new(nil, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao atualizar o cadastro do seu Pet."
    end

    it 'quando não params' do
      pet = create(:pet)

      response = Pets::UpdateService.new(pet, nil).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao atualizar o cadastro do seu Pet."
    end

    it 'quando não possui custo mensal' do
      person = create(:person)
      pet = create(:pet, person: person)
      params = pet.attributes.symbolize_keys
      params[:monthly_cost] = nil

      response = Pets::UpdateService.new(pet, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao atualizar o cadastro do seu Pet #{params[:name].titleize}."
    end

    it 'quando Pessoa não pode ter mais Pets porque já possui custo mensal maior que 1000.00' do
      person = create(:person)
      pet = create(:pet, person: person, monthly_cost: 1_000.01)
      params = pet.attributes.symbolize_keys
      params[:monthly_cost] = 2_000.01

      response = Pets::UpdateService.new(pet, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não aumentar o custo mensal do seu Pet, seu custo mensal já é maior que R$ 1.000,00."
    end

    it 'quando Pessoa não pode ter Gatos' do
      person = create(:person, full_name: 'Agnês Solusa')
      pet = create(:pet, kind: :dog, person: person)
      params = pet.attributes.symbolize_keys
      params[:kind] = :cat

      response = Pets::UpdateService.new(pet, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não pode ter um Gato."
    end

    it 'quando Pessoa não pode ter Andorinhas' do
      person = create(:person, birthdate: '01/01/2018')
      pet = create(:pet, kind: :dog, person: person)
      params = pet.attributes.symbolize_keys
      params[:kind] = :swallow

      response = Pets::UpdateService.new(pet, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não pode ter uma Andorinha."
    end
  end
end
