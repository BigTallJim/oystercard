require 'journeyLog'
describe JourneyLog do
  let(:station) { double :station, zone: 1}

  it "Test JourneyLog gets passed Journey Class on creation" do
    expect(subject.journey_class).to be_an_instance_of(Journey)
  end

  # it "Starts a new journey with entry station" do
  #   expect(subject.start(station).to eq( )
  # end
end
