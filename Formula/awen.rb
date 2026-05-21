class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.1"
  license "MIT"

  depends_on "jq"
  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.1/awen-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "cb61654925dd15471c738177ceb2a2c289dacfdbb99d4b4dbe7af7a80a5d5381"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.1/awen-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0e43e9ed74590bf6cb0d25db1c38882f9df2a085215480c986c04c43ab9f721e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.1/awen-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6ca80b29a4e1492c1d3765a5ed70c9b38b3f3633c1e33667d60953b433cede9"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.1/awen-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c1461269ad725f8e0c8630513947afebe758019e39210cf1274c92f6328f7be"
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
