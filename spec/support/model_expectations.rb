shared_context :model_expectations do
  specify { subject.should be_valid }

  describe '#save' do
    before(:each) { subject.save }
    it { should be_persisted }
  end
end
