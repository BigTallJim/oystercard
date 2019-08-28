require 'oystercard'

describe Oystercard do

  let(:station) { double(:station) }
  let(:station2) { double(:station) }

  it { is_expected.to respond_to(:journey) }

  it "Check that the journey variable exists" do
    expect(subject.journey).to be_instance_of(Hash)
  end

  it "Check that the journeys variable is empty" do
    expect(subject.journeys).to be_empty
  end

  it "new oystercard has default balance of 0" do
    expect(subject.balance).to eq (0)
  end

  it "expect new oystercard to have £10 on, when topped up with 10" do
    expect(subject.top_up(10)).to eq (10)
  end

  it "expect oystercard with £20 to have £30 on, when topped up with 10" do
    subject.top_up(20)
    expect(subject.top_up(10)).to eq (30)
  end

  it "expect an error if balance is more than £90" do
    expect{subject.top_up(91)}.to raise_error "Balance limit is £90"
  end

  it "expect oystercard with £20 to error if £80 added" do
    subject.top_up(20)
    expect{subject.top_up(80)}.to raise_error "Balance limit is £90"
  end

  it "when card touch_out card status in_journey is false" do
    subject.touch_out(station)
    expect(subject).not_to be_in_journey
  end

  it "in journey should be true when you are in journey" do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  describe ".touch_in" do
    context "enough money" do
      before { subject.top_up(10) }
      it "card status is in_journey" do
        subject.touch_in(station)
        expect(subject).to be_in_journey
      end
      it "saving entry station" do
        subject.touch_in(station)
        expect(subject.entry_station).to eq(station)
      end
    end

    context "not enough money" do
      it "raises and error when touching in" do
        expect { subject.touch_in(station) }.to raise_error "balance too low"
      end
    end
  end

  describe ".touch_out" do
    context "enough money on card" do
      it "deduct min journey fair" do
        expect { subject.touch_out(station) }.to change {subject.balance}.by(-1)
      end
    end
  end

  it "adds entry and exit stations to hash" do
    subject.top_up(50)
    subject.touch_in(station)
    subject.touch_out(station2)
    expect(subject.journey).to eq({entry: station, exit: station2})
  end


end




=begin
create Oystercard
create default balance
irb create card then check balance

=end
