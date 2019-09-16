require 'rails_helper'

RSpec.describe People::BasePresenter do
  it 'retorna um Hash' do
    person = create(:person)

    presenter = People::BasePresenter.new.person(person)

    expect(presenter.class).to be Hash
  end
end
