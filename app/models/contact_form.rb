class ContactForm
  include ActiveModel::Model
  attr_reader :organization, :contact, :deal

  def initialize
    @organization = OrganizationFields.new
    @contact = ContactFields.new
    @deal = DealFields.new
  end

  def organization_attributes=(attributes)
    organization.assign_attributes(attributes)
  end

  def contact_attributes=(attributes)
    contact.assign_attributes(attributes)
  end

  def deal_attributes=(attributes)
    deal.assign_attributes(attributes)
  end

  def valid?
    [organization, contact, deal].map(&:valid?).all?
  end

  class OrganizationFields
    include ActiveModel::Model
    attr_accessor :name, :description
    validates :name, presence: true
  end

  class ContactFields
    include ActiveModel::Model
    attr_accessor :name, :email
    validates :name, presence: true
  end

  class DealFields
    include ActiveModel::Model
    attr_accessor :description
    validates :description, presence: true
  end
end
