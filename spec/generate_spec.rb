require_relative "../generate.rb"

RSpec.describe Generate do
  let(:generate) { Generate.new }

  describe "#dates" do
    it "returns an array of 12 Date objects" do
      meetup_dates = generate.dates
      expect(meetup_dates).to be_all(Date)
      expect(meetup_dates.length).to be(Generate::MONTHS_IN_YEAR)
    end

    it "returns a list of Thursdays" do
      meetup_dates = generate.dates
      expect(meetup_dates.map(&:wday)).to be_all(4)
    end

    it "first item returns 16th January" do
      first_meetup_2020 = generate.dates.first
      expect(first_meetup_2020.class).to eq(Date.new(2020,1,16).class)
      expect(first_meetup_2020).to eq(Date.new(2020,1,16))
    end  
  end

  describe "#days_range" do
    it "return range days of month" do
      days = generate.days_range(2020,1)
      expect(days).to cover(Date.new(2020,1,1))
      expect(days).to cover(Date.new(2020,1,-1))
    end
  end

  describe "#print_dates" do
    #let(:generate) { Generate.new }

    it "displays a list of dates in a string formatted Thursday, day, month, year"
      #expect(generate).to not_be_nil
      #generate = Generate.new
      #expect(generate.dates).to be_a(String)
      #expect(generate.dates).to be_a(String)
  end
end