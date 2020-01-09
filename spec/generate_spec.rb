require_relative "../generate.rb"

RSpec.describe Generate do
  describe "#dates" do
    let(:generate) { Generate.new }

    it "returns an array of Time objects" do
      meetup_dates = generate.dates
      expect(meetup_dates).to be_any(Time)
    end

    it "returns a list of Thursdays" do
      meetup_dates = generate.dates
      expect(meetup_dates.map(&:wday)).to be_all(4)
    end
  end
end