module Pets
  class BasePresenter < ::BasePresenter
    def pet(object)
      return {} unless object.present?

      {
        slug: object.slug&.upcase,
        name: object.name&.titleize,
        kind: I18n.t("pets.kinds.#{object.kind}"),
        monthly_cost: {
          value: object.monthly_cost,
          format: number_to_currency(object.monthly_cost)
        },
        quarterly_cost: {
          value: object.quarterly_cost,
          format: number_to_currency(object.quarterly_cost)
        },
        **links(object)
      }
    end

    def kinds
      Pet.kinds.map{ |key, val| [I18n.t("pets.kinds.#{key}"), key] }
    end

    private

    def links(object)
      return {} if object.new_record?

      {
        links: {
          edit: {
            path: edit_person_pet_path(object),
            method: :get
          },
          delete: {
            path: person_pet_path(object),
            method: :delete
          }
        }
      }
    end
  end
end
