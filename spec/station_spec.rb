require 'station'

describe Station do
  it "Test existance of station name" do
    #before { subject.name(10) }
    expect(subject.station_name).to eq("Default")
  end

  it "Test existance of station zone" do
    #before { subject.name(10) }
    expect(subject.station_zone).to eq(0)
  end
end
