require 'spec_helper'

describe GithubAuthorization do

  let(:token) { 'zzz'}
  let(:nickname) { 'aaa' }

  subject { GithubAuthorization.new(token, nickname) }

  describe :new do

    it 'sets token in Authorization header' do
      subject.class.headers['Authorization'].should include("token #{token}")
    end

    it 'sets the github organization' do
      subject.organization.should eq(ENV['GITHUB_ORGANIZATION'])
    end
  end

  describe :organization_membership do

    let(:check_membership_uri) do
      "#{subject.class.base_uri}/orgs/#{subject.organization}/members/#{subject.nickname}"
    end

    context 'when request response returns a 204 HTTP Status' do
      before do
        FakeWeb.register_uri :get,
                             check_membership_uri,
                             status: ['204', 'No Content']
      end

      specify { expect(subject.send(:organization_membership)).to be_true }
    end

    context 'when request response status is other than 204' do
      before do
        FakeWeb.register_uri :get,
                             check_membership_uri,
                             status: ['404', 'Not Found']
      end

      specify { expect(subject.send(:organization_membership)).to be_false }

      it 'receives an error message' do
        subject.send(:organization_membership)
        expect(subject.errors_on(:base)).to include("You don't belong to the staff.")
      end
    end
  end

end
