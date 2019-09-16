class Person < ApplicationRecord
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :pets, dependent: :destroy

  validates :full_name, :birthdate, :document, presence: true
  validates :document, uniqueness: { message: 'Já existe um usuário registrado com este documento' }
  validate :check_document

  before_save :strip_columns

  def strip_columns
    self.full_name = full_name.strip
    self.document = document.strip.delete('/.-')
  end

  def check_document
    errors.add(:document, 'não é válido') unless CPF.valid?(document)
  end

  def adult?
    (((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor) > 18
  end

  def can_had_swallows?
    adult?
  end

  def can_had_cats?
    full_name[0].downcase != 'a'
  end

  def total_monthly_cost
    pets.active.sum { |pet| pet.persisted? ? pet.monthly_cost : 0.0 }
  end

  def total_quarterly_cost
    pets.active.sum { |pet| pet.persisted? ? pet.quarterly_cost : 0.0 }
  end

  def can_had_more_pets?
    total_monthly_cost <= 1_000
  end
end
