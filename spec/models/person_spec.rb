require 'rails_helper'

RSpec.describe 'Person', type: :model do
  it 'criado com sucesso' do
    expect(create(:person)).to be_valid
  end

  describe 'espera exception' do
    it 'quando não possui nome completo' do
      expect { create(:person, full_name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui data de nascimento' do
      expect { create(:person, birthdate: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui senha' do
      expect { create(:person, password: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando possui email inválido' do
      expect { create(:person, email: 'nil.com') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui email' do
      expect { create(:person, email: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui documento inválido' do
      expect { create(:person, document: '33333') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando não possui não documento' do
      expect { create(:person, document: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'quando possui duplicidade de email' do
      create(:person, email: 'carlos@person.com')
      expect { create(:person, email: 'carlos@person.com') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
