module People
  class BasePresenter < ::BasePresenter
    def person(person)
      return {} unless person.present?

      {
        full_name: person.full_name.titleize,
        birthdate: I18n.l(person.birthdate, format: :default),
        total_monthly_cost: number_to_currency(person.total_monthly_cost),
        total_quarterly_cost: number_to_currency(person.total_quarterly_cost),
        adult?: person.adult?,
        can_has_swallow: person.can_had_swallows?,
        can_had_cats?: person.can_had_cats?,
        can_had_more_pets?: person.can_had_more_pets?
      }
    end
  end
end
