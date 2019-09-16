require 'rails_helper'

RSpec.describe Pets::IndexPresenter do
  it 'retorna um Hash' do
    pets = create_list(:pet, 2)

    presenter = Pets::IndexPresenter.new(pets).call

    expect(presenter.class).to be Hash
  end
end
