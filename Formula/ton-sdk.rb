class TonSdk < Formula
  desc "TONOS Client Library for TON DApp development"
  homepage "https://github.com/tonlabs/TON-SDK"
  url "https://github.com/tonlabs/TON-SDK.git",
      tag:      "1.5.2",
      revision: "44d7c3955bfc20183bebd22d795f7962fa2f5ee4"
  license "Apache-2.0"
  head "https://github.com/tonlabs/TON-SDK.git"

  depends_on "rust" => :build

  def install
    cd "ton_client" do
      system "cargo", "build", "--release", "--target-dir", "target"
      include.install "tonclient.h"
      on_macos do
        lib.install "target/release/libton_client.dylib"
      end
      on_linux do
        lib.install "target/release/libton_client.so"
      end
    end
  end
end
