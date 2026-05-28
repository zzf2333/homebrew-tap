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
      sha256 "491dfc0f563764d1d4f475e6cf82985f3c16d3df827c16795f57e60d423a5b13"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "773da3fdcef4fcbc736204f8a6c7ef1b92f642051827cae5cb7ff8f10d39da9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9e455c553eea4df0abd01ac6123da6acef9041157bec1768ced2c6cd5037b7e"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d657a8dc3491666a7a30101a0a5e155bd1be0c72db4a74e4b513fb29b03ffe98"
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
