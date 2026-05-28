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
      sha256 "b58d2b16a48e469be173f8f41bbe47a3363639eb0ea289682095931d85d0e07b"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "72929beee256064f5bab64b5f6eb26bc2d14c7968a59bc6b82e7009e46d6fc23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40bf609ed8a2a754324ab5adbaabe922546235100717b96427a78d5ee8c0d584"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.5/awen-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5236d2b157d98c5b8f1314095e3fd5ca3dca6fa2c17aedf295a79ddf4dc38287"
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
