module Pets
  class UpdateService < BaseService
    def initialize(pet, params)
      @pet = pet
      @person = @pet.person
      @params = params
    end

    def call
      OpenStruct.new(success?: false, message: 'Desculpe mas tivemos uma dificuldade ao atualizar o cadastro do seu Pet') unless pet || params

      params[:monthly_cost] = FixedParams.money(params[:monthly_cost])

      pet.name = params[:name]
      pet.kind = params[:kind]
      pet.monthly_cost = params[:monthly_cost]

      response = can_change?(person, @pet)
      return response unless response.success?

      pet.save!

      OpenStruct.new(success?: true)
    rescue StandardError => e
      Rails.logger.error e

      OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas tivemos uma dificuldade ao atualizar o cadastro do seu Pet #{ pet.name.titleize }")
    end

    private
    attr_reader :pet, :person, :params
  end
end
