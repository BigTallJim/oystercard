require 'journey'
describe Journey do
  let(:station) { double :station, zone: 1}

  it "sets entry_station"do
    expect(subject.entry_station).to eq nil
  end

  it "sets an exit_station"do
    expect(subject.exit_station).to eq nil
  end

  describe "#fare" do
    it "returns MINIMUMFARE" do
      subject.entry_station = "one"
      subject.exit_station = "two"
      expect(subject.fare).to eq Journey::MINIMUMFARE
    end

    it "returns PENALTY" do
      expect(subject.fare).to eq Journey::PENALTY
    end
  end

  describe "#complete?"
  it "returns true if touched in and out" do
    subject.entry_station = "one"
    subject.exit_station = "two"
    expect(subject.complete?).to eq true
  end

  it "returns false if didn't touch in or out" do
    expect(subject).not_to be_complete
  end

  describe "#finish" do
    it "returns itself when finishes journey" do
      expect(subject.finish(station)).to eq(subject)
    end
  end
end
