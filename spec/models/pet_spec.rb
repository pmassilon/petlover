require 'rails_helper'

RSpec.describe 'Pet', type: :model do
  it 'criado com sucesso' do
    expect(create(:pet)).to be_valid
  end

  describe 'espera exception' do
    it 'quando não possui nome' do
      expect { create(:pet, name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui tipo' do
      expect { create(:pet, kind: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando uma pessoa possui dois Pet com o memos nome e tipo' do
      person = create(:person)
      create(:pet, name: 'Rex', kind: :dog, person: person)
      expect { create(:pet, name: 'Rex', kind: :dog, person: person) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui custo mensal' do
      expect { create(:pet, monthly_cost: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
