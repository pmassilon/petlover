require 'rails_helper'

RSpec.describe Pets::NewPresenter do
  it 'retorna um Hash' do
    pet = create(:pet)

    presenter = Pets::EditPresenter.new(pet).call

    expect(presenter.class).to be Hash
  end
end
