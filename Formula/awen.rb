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
      sha256 "8e0322d1c332d6156e7812fe9bef52b318a65f844ed97072424a3c2f1eaab6ca"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "19205060151d672b311d810fc15a40b2da5604e99478cc61ad63916731ef7b15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbdd8ea94608a23709aad92f77a3f06b92830128f400f8d7cddd8487a5b51824"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6c6a1bcfc0a373235d35b3e2fd655ffc9259599f31403318d424e631a1ad9c4"
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
