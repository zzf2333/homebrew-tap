class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb7d37590188a5d3b02de5a5e35b1519a20c4a7faa2b5387d8c7103380481d23"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "69aeacae9dd7c712a6a89ed9423b00d40a9b12e80cf63560b17fafe9e8756562"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "952ddede23f3fa7706af730cbd2f1fac5795e3e5d19f8c9458eed6ef8f6ce6d4"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05300f10895f005fcd53882dc46a36af15f567de7908adfdd8125b2a7ecb675b"
    end
  end

  def install
    bin.install "awen"
    (share/"awen").install "awen.zsh"
  end

  def caveats
    <<~EOS
      Add this line to your ~/.zshrc:
        source #{opt_share}/awen/awen.zsh

      Then restart your shell or run: source ~/.zshrc

      Awen will create ~/.config/awen/ and ~/.local/share/awen/ on first launch.

      Optional dependencies for best performance:
        brew install jq socat
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awen --version")
  end
end
