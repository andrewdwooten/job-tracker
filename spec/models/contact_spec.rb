require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name' do
        company = Company.create(name: 'Test')
        contact = Contact.new( position: 'boss',
                               email: '123@test.com',
                               company_id: company.id)
        expect(contact).to be_invalid
      end

      it 'is invalid without a position' do
        company = Company.create(name: 'Test')
        contact = Contact.new( name: 'boss',
                               email: '123@test.com',
                               company_id: company.id)
        expect(contact).to be_invalid
      end

      it 'is invalid without an email' do
        company = Company.create(name: 'Test')
        contact = Contact.new( position: 'boss',
                               name: 'boss',
                               company_id: company.id)
        expect(contact).to be_invalid
      end

      it 'is invalid without a company' do
        contact = Contact.new( position: 'boss',
                               email: '123@test.com',
                               name: 'boss')
        expect(contact).to be_invalid
      end

      it 'is valid with all attributes' do
        company = Company.create(name: 'Test')
        contact = Contact.new( position: 'boss',
                               email: '123@test.com',
                               company_id: company.id,
                               name: 'boss')
        expect(contact).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a company' do
      company = Company.create(name: 'Test')
      contact = Contact.create( position: 'boss',
                             email: '123@test.com',
                             company_id: company.id,
                             name: 'boss')
      expect(contact).to respond_to(:company)
    end
  end
end
