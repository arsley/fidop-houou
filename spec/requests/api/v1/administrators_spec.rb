RSpec.describe 'Api::V1::Administrators', type: :request do
  let!(:administrator) { create(:administrator) }
  let!(:token) { administrator.create_access_token!.to_jwt }
  let(:headers) do
    {
      Authorization: "Bearer #{token}",
      'Content-Type': 'application/json',
      Accept: 'application/json'
    }
  end

  describe 'GET /api/v1/administrators' do
    subject { get api_v1_administrators_url, headers: }

    context 'Correct - 200' do
      context 'when no administrators exist' do
        it 'returns empty array response' do
          subject
          expect(json).to be_a(Array)
          expect(json.length).to eq(0)
        end

        it { is_expected_response.to have_http_status(200) }
      end

      context 'when 10 administrators exist' do
        let(:administrators_count) { 10 }
        let!(:administrators) { create_list(:administrator, administrators_count) }

        it 'returns response that array of administrators' do
          subject

          expect(json).to be_a(Array)
          expect(json.length).to eq(administrators_count)
          expect(unsymbolized_json).to eq(administrators.as_json)
        end

        it { is_expected_response.to have_http_status(200) }
      end
    end

    context 'Illegal - 401' do
      context 'when no token specified' do
        let(:token) { '' }
        it { is_expected_response.to have_http_status(401) }
      end
    end
  end

  describe 'GET /api/v1/administrators/:id' do
    let!(:administrator) { create(:administrator) }
    let(:administrator_id) { administrator.id }

    subject { get api_v1_administrator_url(administrator_id), headers: }

    context 'Correct - 200' do
      context 'when administrator exists' do
        it 'returns response for administrator' do
          subject

          expect(json[:name]).to eq(administrator.name)
          expect(json[:discord_id]).to eq(administrator.discord_id)
        end

        it { is_expected_response.to have_http_status(200) }
      end
    end

    context 'Illegal - 401' do
      context 'when no token specified' do
        let(:token) { '' }
        it { is_expected_response.to have_http_status(401) }
      end
    end

    context 'Illegal - 404' do
      context 'when specified administrator does not exist' do
        let(:administrator_id) { -1 }

        it { is_expected_response.to have_http_status(404) }
      end
    end
  end

  describe 'POST /api/v1/administrators' do
    let(:name) { Faker::Name.name }
    let(:discord_id) { Faker::Number.number(digits: 18).to_s }
    let(:params) do
      { name:, discord_id: }.to_json
    end

    subject { post api_v1_administrators_url, headers:, params: }

    context 'Correct - 201' do
      context 'when request with valid params' do
        it 'returns created resource' do
          subject

          expect(json[:name]).to eq(name)
          expect(json[:discord_id]).to eq(discord_id)
        end

        it { is_expected_response.to have_http_status(201) }
      end
    end

    context 'Illegal - 401' do
      context 'when no token specified' do
        let(:token) { '' }
        it { is_expected_response.to have_http_status(401) }
      end
    end

    context 'Illegal - 422' do
      context 'when name does not specified' do
        let(:name) { nil }

        it { is_expected_response.to have_http_status(422) }
      end
    end
  end

  describe 'PATCH/PUT /api/v1/administrators/:id' do
    let!(:administrator) { create(:administrator) }
    let(:administrator_id) { administrator.id }

    let(:name) { Faker::Name.name }
    let(:discord_id) { Faker::Number.number(digits: 18).to_s }
    let(:params) do
      { name:, discord_id: }.to_json
    end

    subject { put api_v1_administrator_url(administrator_id), headers:, params: }

    context 'Correct - 200' do
      context 'when request with valid params' do
        it 'returns updated resource' do
          subject

          expect(json[:name]).to eq(name)
          expect(json[:discord_id]).to eq(discord_id)
        end

        it { is_expected_response.to have_http_status(200) }
      end
    end

    context 'Illegal - 401' do
      context 'when no token specified' do
        let(:token) { '' }
        it { is_expected_response.to have_http_status(401) }
      end
    end

    context 'Illegal - 422' do
      context 'when name does not specified' do
        let(:name) { nil }

        it { is_expected_response.to have_http_status(422) }
      end
    end
  end

  describe 'DELETE /api/v1/administrators/:id' do
    let!(:administrator) { create(:administrator) }
    let(:administrator_id) { administrator.id }

    subject { delete api_v1_administrator_url(administrator_id), headers: }

    context 'Correct - 200' do
      context 'when specified administrator exists' do
        it { is_expected_response.to have_http_status(204) }
      end
    end

    context 'Illegal - 401' do
      context 'when no token specified' do
        let(:token) { '' }
        it { is_expected_response.to have_http_status(401) }
      end
    end
  end
end
