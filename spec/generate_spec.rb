require_relative "../generate.rb"

RSpec.describe Generate do
  describe "#dates" do
    it "returns an Array" do
      generate = Generate.new
      meetup_dates = generate.dates
      expect(meetup_dates.class).to be(Array)
    end
  end
end