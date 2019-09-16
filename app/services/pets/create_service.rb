module Pets
  class CreateService < BaseService
    def initialize(person, params)
      @person = person
      @params = params
    end

    def call
      OpenStruct.new(success?: false, message: 'Desculpe mas tivemos uma dificuldade ao cadastrar o seu Pet') unless person || params

      params[:monthly_cost] = FixedParams.money(params[:monthly_cost])

      @pet = person.pets.new(params)

      response = can_had?(person, @pet)
      return response unless response.success?

      @pet.save!

      OpenStruct.new(success?: true, message: "O Pet #{@pet.name.titleize} foi adicionada a lista.")
    rescue StandardError => e
      Rails.logger.error e

      OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas tivemos uma dificuldade ao cadastrar o seu Pet #{ pet.name.titleize }.")
    end

    private

    attr_reader :person, :pet, :params
  end
end
