module People
  class IndexPresenter < People::BasePresenter
    def initialize(people)
      @people = people
    end

    def call
      people.map { |person| person(person) }
    end

    private

    attr_reader :people
  end
end
