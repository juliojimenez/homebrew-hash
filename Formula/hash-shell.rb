class HashShell < Formula
  desc "Command line interpreter (shell) for Linux and macOS"
  homepage "https://github.com/juliojimenez/hash"
  url "https://github.com/juliojimenez/hash/archive/refs/tags/v22.tar.gz"
  sha256 "077036004e039eb407579f50f5161451cbb1409db5834fc4e3bb1a0be56b403b"
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
    EOS
  end

  test do
    assert_predicate bin/"hash-shell", :exist?
    assert_predicate bin/"hash-shell", :executable?
  end
end
