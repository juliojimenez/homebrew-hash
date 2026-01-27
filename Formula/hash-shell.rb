class HashShell < Formula
  desc "Modern, POSIX-compliant command line interpreter (shell) for Linux and macOS"
  homepage "https://github.com/juliojimenez/hash"
  url "https://github.com/juliojimenez/hash/archive/refs/tags/v31.tar.gz"
  sha256 "6af0e058e1638d10ecc2ea7b68143621b3d26e67e5a8b662d9b77f6e9b9953d7"
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
