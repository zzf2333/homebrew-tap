class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.2"
  license "MIT"

  depends_on "jq"
  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.2/awen-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "30b21286149bd872789eea6ae493f20e0494520f9baa058d7fcf1792a6b4a9dc"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.2/awen-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "9893fa68a521baa480655c9db810b4feaae0750db9ecbfcc596eb81bf0fa9c87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.2/awen-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d2a13202755e4448940e385d70e7de1ca4dbc3d8cb64b60df5ef31de79c84dc"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.2/awen-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "686a8aad0fe34a0e0731f6a0784cda37c138e8550e0f60439359a95abaa789d4"
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
