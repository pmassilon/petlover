module Pets
  class BaseService
    def can_had?(person, pet)
      return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não cadastrar mais Pets, seu custo mensal já é maior que R$ 1.000,00.") unless person.can_had_more_pets?
      return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não pode ter um Gato.") unless person.can_had_cats? if pet.cat?
      return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não pode ter uma Andorinha.") unless person.can_had_swallows? if pet.swallow?

      OpenStruct.new(success?: true, message: 'Pode registrar o Pet')
    end

    def can_change?(person, pet)
      if pet.monthly_cost_changed?
        old_monthly_cost, new_monthly_cost = pet.changes[:monthly_cost]
        return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não aumentar o custo mensal do seu Pet, seu custo mensal já é maior que R$ 1.000,00.") unless person.can_had_more_pets? || new_monthly_cost < old_monthly_cost
      end
      return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não pode ter um Gato.") unless person.can_had_cats? if pet.kind_changed? && pet.cat?
      return OpenStruct.new(success?: false, pet: pet, message: "Desculpe mas você não pode ter uma Andorinha.") unless person.can_had_swallows? if pet.kind_changed? && pet.swallow?

      OpenStruct.new(success?: true, message: 'Pode atualizar o Pet')
    end
  end
end
