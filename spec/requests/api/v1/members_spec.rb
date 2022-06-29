RSpec.describe 'Api::V1::Members', type: :request do
  describe 'GET /api/v1/members/:id' do
    let!(:member) { create(:member) }

    subject { get api_v1_member_path(member) }

    it "can show member's info" do
      subject
      expect(json['id']).to eq(member.id)
    end

    it 'returns status code 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
