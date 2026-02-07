class HashShell < Formula
  desc "Modern, POSIX-compliant command line interpreter (shell) for Linux and macOS"
  homepage "https://github.com/juliojimenez/hash"
  url "https://github.com/juliojimenez/hash/archive/refs/tags/v35.tar.gz"
  sha256 "53b25e5f5a0f47d957705de0b3cf2572880ea6d167de4464eb84c2e1b3a85260"
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
