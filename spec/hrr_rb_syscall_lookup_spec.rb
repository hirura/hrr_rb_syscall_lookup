RSpec.describe HrrRbSyscallLookup do
  it "has a version number" do
    expect(HrrRbSyscallLookup::VERSION).not_to be nil
  end

  describe ".name_to_num" do
    context "with valid system call name argument" do
      it "returns a number as same as ausyscall(8)" do
        expect(HrrRbSyscallLookup.name_to_num("write")).to eq(`ausyscall --exact write`.to_i)
      end
    end

    context "with invalid system call name argument" do
      context "\"\"" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.name_to_num("")).to be_nil
        end
      end

      context "\"unknown system call\"" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.name_to_num("unknown system call")).to be_nil
        end
      end

      context "not kind of String" do
        it "raises TypeError" do
          expect{HrrRbSyscallLookup.name_to_num(0)}.to raise_error TypeError
        end
      end
    end
  end

  describe ".num_to_name" do
    context "with valid system call number argument" do
      it "returns a name as same as ausyscall(8)" do
        expect(HrrRbSyscallLookup.num_to_name(1)).to eq(`ausyscall --exact 1`.chomp)
      end
    end

    context "with invalid system call number argument" do
      context "12345 (impossible system call number)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(12345)).to be_nil
        end
      end

      context "2**31 - 1 (possibly INT_MAX)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(2**31 - 1)).to be_nil
        end
      end

      context "- 2**31 (possibly INT_MIN)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(- 2**31)).to be_nil
        end
      end

      context "2**31 (possibly too big to convert to `int')" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(2**31)).to be_nil
        end
      end

      context "- 2**31 - 1 (possibly too small to convert to `int')" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(- 2**31 - 1)).to be_nil
        end
      end

      context "2**63 - 1 (possibly LONG_MAX)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(2**63 - 1)).to be_nil
        end
      end

      context "- 2**63 (possibly LONG_MIN)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(- 2**63)).to be_nil
        end
      end

      context "2**63 (possibly Bignum)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(2**63)).to be_nil
        end
      end

      context "- 2**63 - 1 (possibly Bignum)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(- 2**63 - 1)).to be_nil
        end
      end

      context "12345678901234567890 (Bignum)" do
        it "returns nil" do
          expect(HrrRbSyscallLookup.num_to_name(12345678901234567890)).to be_nil
        end
      end

      context "not kind of Integer" do
        it "raises TypeError" do
          expect{HrrRbSyscallLookup.num_to_name("")}.to raise_error TypeError
        end
      end
    end
  end
end
