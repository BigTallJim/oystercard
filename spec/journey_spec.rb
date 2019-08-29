require 'journey'
describe Journey do
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
end
