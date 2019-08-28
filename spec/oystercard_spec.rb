require 'oystercard'

describe Oystercard do

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

  it "card with £50 should reduce to £40 when £10 is spent" do
    subject.top_up(50)
    expect(subject.deduct(10)).to eq(40)
  end

  it "card with £60 should reduce to £0 when £60 is spent" do
    subject.top_up(60)
    expect(subject.deduct(60)).to eq(0)
  end



  it "when card touch_out card status in_journey is false" do
    expect(subject.touch_out).to eq (false)
  end

  it "in journey should be true when you are in journey" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.in_journey?).to eq (true)
  end

  describe ".touch_in" do

    it "card status is in_journey" do
      subject.top_up(10)
      expect(subject.touch_in).to eq (true)
    end

    context "not enough money" do
      it "raises and error when touching in" do
        expect{subject.touch_in}.to raise_error "balance too low"
      end
    end
  end
end




=begin
create Oystercard
create default balance
irb create card then check balance

=end
