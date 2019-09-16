class Pet < ApplicationRecord
  extend FriendlyId

  belongs_to :person

  enum kind: {
              dog: 0,
              cat: 1,
              swallow: 2,
              horse: 3,
              parrot: 4,
              llama: 5,
              iguana: 6,
              platypus: 7
            }

  before_save :strip_name

  validates :name, :kind, :person, presence: true
  validates :name, uniqueness: { scope: %i[person kind], message: 'você já tem um PET com o mesmo nome' }
  validate :valid_monthly_cost
  validates :slug, uniqueness: true

  friendly_id :slug_candidates, use: %i[slugged finders]

  scope :deleted, -> { where.not(deleted_at: nil) }
  scope :active, -> { where(deleted_at: nil) }

  def slug_candidates
    prefix = I18n.t("pets.kinds.#{kind}").to_s.first.strip
    sufixo = name.to_s.first.strip
    ["#{prefix}#{sufixo}#{SecureRandom.hex(1)}", "#{prefix}#{sufixo}#{SecureRandom.hex(2)}", "#{prefix}#{sufixo}#{SecureRandom.hex(4)}"]
  end

  def strip_name
    self.name = name.strip
  end

  def valid_monthly_cost
    return errors.add(:monthly_cost, 'não possui um valor válido') unless monthly_cost.present? && monthly_cost.positive?
  end

  def quarterly_cost
    monthly_cost * 3
  end
end
