
RSpec.describe InsertMoney do
  let(:required_sum) { 3 }
  subject { described_class.new(required_sum) }

  it "Prints only available products and without errors" do
    allow(Readline).to receive(:readline).and_return('50c', '1$', '2$')
    expect {
      puts subject.call
    }.to output(/#{Regexp.quote("Inserted: 0$, Required: #{required_sum}")}/).to_stdout
    allow(Readline).to receive(:readline).and_return('50c', '1$', '2$')
    expect {
      puts subject.call
    }.to output(/#{Regexp.quote("Thanks, take your product and your change: 1.0$")}/).to_stdout

    expect { puts subject.call }.not_to output.to_stderr
  end
  
  it "Take change back" do
    allow(Readline).to receive(:readline) { '2$' }

    expect {
      puts subject.call
    }.to output(/#{Regexp.quote("Thanks, take your product and your change: 1$")}/).to_stdout

    expect { puts subject.call }.not_to output.to_stderr
  end
end
