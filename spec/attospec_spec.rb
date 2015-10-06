require "spec_helper"

describe Attospec do
  describe "[methods]" do
    it "should respond to #does?" do
      expect(Attospec).to respond_to :does?
    end

    it "should respond to #is?" do
      expect(Attospec).to respond_to :is?
    end
  end

  describe "[inclusion]" do
    class Microspec
      include Attospec
    end

    subject { Microspec.new }

    it { should respond_to :does? }
    it { should respond_to :is? }
  end

  describe "[assertions]" do
    describe "success" do
      before do
        Attospec.reset
        Attospec.does? { 1 == 1 }
      end

      it "should record a success" do
        expect(Attospec.results).to eq "."
      end

      it "should not record a failure" do
        expect(Attospec.failures).to be_empty
      end
    end

    describe "failure" do
      before do
        Attospec.reset
        @file = __FILE__.split("/").last
        @line = __LINE__
        Attospec.does? { 1 == 2 }
      end

      it "should record a failed test run" do
        expect(Attospec.results).to eq "F"
      end

      it "should record the failure message" do
        expect(Attospec.failures).to include "%s:%0.3d" % [@file, @line + 1]
      end
    end

    describe "error" do
      before do
        Attospec.reset
        @file = __FILE__.split("/").last
        @line = __LINE__
        Attospec.does? { foo == 2 }
      end

      it "should record a failed test run" do
        expect(Attospec.results).to eq "F"
      end

      it "should record the failure message" do
        expect(Attospec.failures).to include "%s:%0.3d" % [@file, @line + 1]
      end

    end
  end
end
