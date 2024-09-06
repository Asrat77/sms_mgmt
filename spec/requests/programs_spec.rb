require 'rails_helper'

RSpec.describe '/programs', type: :request do
  let(:valid_attributes) do
    {
      code: Faker::Alphanumeric.alpha(number: 6),
      name: Faker::Name.name
    }
  end

  let(:invalid_attributes) do
    {
      code: Faker::Alphanumeric.alpha(number: 6),
      name: nil
    }
  end

  let(:new_attributes) do
    {
      name: Faker::Name.name
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Program.create! valid_attributes
      get programs_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      program = Program.create! valid_attributes
      get program_url(program)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Program' do
        expect do
          post programs_url, params: { program: valid_attributes }
        end.to change(Program, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Program' do
        expect do
          post programs_url, params: { program: invalid_attributes }
        end.to change(Program, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested program' do
        program = Program.create! valid_attributes
        patch program_url(program), params: { program: new_attributes }
        program.reload
        expect(program.name).to eq(new_attributes[:name])
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e., to display the 'edit' template)" do
        program = Program.create! valid_attributes
        patch program_url(program), params: { program: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested program' do
      program = Program.create! valid_attributes
      expect do
        delete program_url(program)
      end.to change(Program, :count).by(-1)
    end
  end
end
