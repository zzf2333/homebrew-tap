class Awen < Formula
  desc "Terminal Intelligence Layer - Smart when you need it, silent when you don't"
  homepage "https://github.com/zzf2333/Awen"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0f84d3ccd20b1dea3a1570ef4fb8ed7864d5e35aa9c9415a4677663cd91ebd65"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "9479a7c18ad5b13d186c626eefe6286cb14e28b049f18e107c3870fe7e2912f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3e14741e703aa3cddf9c255a3fdb6a12730b2ecbcd91a07c3c2cf473796ed7d"
    end
    on_intel do
      url "https://github.com/zzf2333/Awen/releases/download/v0.1.0/awen-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e48b8dcb9d956a099cf9642e74e1f321300b5bb8de97c30f5359002e4f0ace0d"
    end
  end

  def install
    bin.install "awen"
    (share/"awen").install "awen.zsh"
  end

  def post_install
    config_dir = Pathname.new("#{Dir.home}/.config/awen")
    config_dir.mkpath
    data_dir = Pathname.new("#{Dir.home}/.local/share/awen")
    data_dir.mkpath

    plugin_dest = config_dir/"awen.zsh"
    plugin_dest.unlink if plugin_dest.symlink? || plugin_dest.exist?
    plugin_dest.make_symlink(opt_share/"awen/awen.zsh")

    zshrc = Pathname.new("#{Dir.home}/.zshrc")
    return unless zshrc.exist?
    return if zshrc.read.include?("awen.zsh")

    zshrc.open("a") do |f|
      f.puts ""
      f.puts "# Awen — Terminal Intelligence Layer"
      f.puts "source #{config_dir}/awen.zsh"
    end
  end

  def caveats
    <<~EOS
      Awen has been configured automatically:
        - Plugin symlinked to ~/.config/awen/awen.zsh
        - Source line added to ~/.zshrc (if not already present)

      Restart your shell or run: source ~/.zshrc

      Optional dependencies for best performance:
        brew install jq     # More robust JSON handling
        brew install socat  # Faster socket communication
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/awen --version")
  end
end
