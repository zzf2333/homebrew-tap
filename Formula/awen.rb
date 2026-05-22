class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.3"
  license "MIT"

  depends_on "jq"
  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.3/awen-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "0f77c201a8c83f1a4293d3167154139f04017f2a34426850e9c96b9d53eaf220"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.3/awen-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "f0eecddfd5a675d3e6043e37702f28bc308b0e15701bbc0bf8fba7369519ad49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.3/awen-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62ca478577197f59ac57edc0c2de395f7f74b34afc5dd0f784b6e583ce9e8bfd"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.3/awen-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70e98fbb587a265ce5cd392910e260a7a7e96f48add929987e6c1b8ae2b85e05"
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
