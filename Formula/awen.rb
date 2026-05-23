class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.4"
  license "MIT"

  depends_on "jq"
  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.4/awen-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "fbb1dbd20858226248e51094197dd2443b8bfdec708dd989623831db14e2f18e"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.4/awen-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "0a3a0939aa57b9a016540084a48d1eee7022d67ad1396eabff0dc581cd65ea5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.4/awen-0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a64c7ccbee532ea4b978c5b5c21b27a13e2bd55b20fbb4cb252a724a0a7ccc28"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.4/awen-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5da8b33d79ff19204d8f74ef228fb868c48f6d9f762ff1a158d3d9a8bb4a8511"
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
