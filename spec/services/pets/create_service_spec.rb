require 'rails_helper'

RSpec.describe Pets::CreateService do
  it 'criado com sucesso' do
    person = create(:person)
    params = attributes_for(:pet, person: person)

    response = Pets::CreateService.new(person, params).call

    expect(response.success?).to eq true
    expect(response.message).to eq "O Pet #{params[:name].titleize} foi adicionada a lista."
  end

  describe 'espera exception' do
    it 'quando não Pessoa' do
      params = attributes_for(:pet)

      response = Pets::CreateService.new(nil, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao cadastrar o seu Pet."
    end

    it 'quando não params' do
      person = create(:person)

      response = Pets::CreateService.new(person, nil).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao cadastrar o seu Pet."
    end

    it 'quando não possui custo mensal' do
      person = create(:person)
      params = attributes_for(:pet, person: person, monthly_cost: nil)

      response = Pets::CreateService.new(person, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas tivemos uma dificuldade ao cadastrar o seu Pet #{params[:name].titleize}."
    end

    it 'quando Pessoa não pode ter mais Pets porque já possui custo mensal maior que 1000.00' do
      person = create(:person)
      create(:pet, person: person, monthly_cost: 1_000.01)
      params = attributes_for(:pet, person: person, monthly_cost: nil)

      response = Pets::CreateService.new(person, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não cadastrar mais Pets, seu custo mensal já é maior que R$ 1.000,00."
    end

    it 'quando Pessoa não pode ter Gatos' do
      person = create(:person, full_name: 'Agnês Solusa')
      params = attributes_for(:pet, kind: :cat, person: person)

      response = Pets::CreateService.new(person, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não pode ter um Gato."
    end

    it 'quando Pessoa não pode ter Andorinhas' do
      person = create(:person, birthdate: '01/01/2018')
      params = attributes_for(:pet, kind: :swallow, person: person)

      response = Pets::CreateService.new(person, params).call

      expect(response.success?).to eq false
      expect(response.message).to eq "Desculpe mas você não pode ter uma Andorinha."
    end
  end
end
