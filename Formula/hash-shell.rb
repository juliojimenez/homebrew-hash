class HashShell < Formula
  desc "Modern, POSIX-compliant command line interpreter (shell) for Linux and macOS"
  homepage "https://github.com/juliojimenez/hash"
  url "https://github.com/juliojimenez/hash/archive/refs/tags/v37.tar.gz"
  sha256 "08d1221f9cb2a00d6b43e1a7d3d990c7ed263ef97b0e320b254c5e860dc25052"
  license "Apache-2.0"
  head "https://github.com/juliojimenez/hash.git", branch: "main"

  on_macos do
    depends_on xcode: :build
  end

  on_linux do
    depends_on "gcc" => :build
  end

  def install
    system "make", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      To use hash-shell as your default shell, add it to /etc/shells:
        sudo bash -c 'echo "#{opt_bin}/hash-shell" >> /etc/shells'

      Then change your shell:
        chsh -s #{opt_bin}/hash-shell

      Configuration file: ~/.hashrc
      History file: ~/.hash_history

      View the man page for full documentation:
        man hash-shell
    EOS
  end

  test do
    assert_predicate bin/"hash-shell", :exist?
    assert_predicate bin/"hash-shell", :executable?
    assert_predicate man1/"hash-shell.1", :exist?
  end
end
