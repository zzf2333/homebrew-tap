class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.5"
  license "MIT"

  depends_on "jq"
  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "77bc642e19c10dfa42a512f71148921010a85a4bf3f5790f4d102b7b20412ca6"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "bb6d13c2a28d740e305e99cb7f72c9489285e6ec5488137d39074daa78aeb7aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f59571dfa6dee7f651eecabce2d6891b92f6bbeffe380ea5a7a09d7a7104537b"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b5d4c394d99a0caaf8c29a4d36d31112d0e2a8eb43d02bae2986ddf4793e4b8"
    end
  end

  def install
    bin.install "awen"
    (share/"awen").install "awen.zsh"
  end

  def caveats
    <<~EOS
      Run "awen setup" to configure your shell, then restart your terminal.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awen --version")
  end
end
