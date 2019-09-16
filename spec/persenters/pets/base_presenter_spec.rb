require 'rails_helper'

RSpec.describe Pets::BasePresenter do
  it 'retorna um Hash' do
    pet = create(:pet)

    presenter = Pets::BasePresenter.new.pet(pet)

    expect(presenter.class).to be Hash
  end

  it 'retorna um Array' do
    pet = create(:pet)

    presenter = Pets::BasePresenter.new.kinds
    expect(presenter.class).to be Array
  end
end
