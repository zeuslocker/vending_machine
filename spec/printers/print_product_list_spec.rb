
RSpec.describe PrintProductList do
  subject { described_class.new }

  it "Prints only available products and without errors" do
    expect { puts subject.call }.not_to output('Lays').to_stdout
    expect { puts subject.call }.not_to output.to_stderr
  end

  it "Prints all available products" do
    available_products_names = Constants::PRODUCT_LIST.reject{|p| p.count <= 0 }.map(&:name)
    available_products_names.each do |p_name|
      expect { puts subject.call }.to output(Regexp.new(p_name)).to_stdout   
    end
  end
end
