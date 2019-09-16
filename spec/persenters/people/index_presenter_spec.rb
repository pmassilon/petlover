require 'rails_helper'

RSpec.describe People::IndexPresenter do
  it 'retorna um Hash' do
    people = create_list(:person, 2)

    presenter = People::IndexPresenter.new(people).call

    expect(presenter.class).to be Hash
  end
end
