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
      sha256 "80709c2b95557eb12244125367f235e9470318fbad30da79d41c320d89278e5e"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "ed312a3b8c79764b9588f3e767bb3d6317f715c1d52a8cb2ecec5465815ed16d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29c47b9a73f62825fd1fa6d1eb776454872bfa83b9740d559dc2f197907e3eea"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "232db85f21bcc919600d87b9c8a91dea25d151a9cd60623ea59d75ead6c3c277"
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
