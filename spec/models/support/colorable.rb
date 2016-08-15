require 'rails_helper'

RSpec.shared_examples_for "with coloration" do |attrs|
  attrs = [attrs].flatten
  let(:instance) { build(described_class.name.underscore.to_sym) }
  
  attrs.each do |attr|
    it "should add #{attr}_hex method" do
      expect(instance.send("#{attr}_hex")).to be_a String
    end

    it "should add #{attr}_rgb method" do
      expect(instance.send("#{attr}_rgb")).to be_a Array
    end
  end
end
