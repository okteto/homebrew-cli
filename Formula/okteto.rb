class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.6.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "db43f639575c99c29b50d8f0387a076d9a21b7e0b14cd8f7406dcc800fe87594"
    url "https://github.com/okteto/okteto/releases/download/2.6.0/okteto-Darwin-arm64"
  else
    sha256 "6f8d9f4dec9f804735809b03de17e81ba468abc58e2e7e8d265d247d85ae976c"
    url "https://github.com/okteto/okteto/releases/download/2.6.0/okteto-Darwin-x86_64"
  end

  head do
    if Hardware::CPU.arm?
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-arm64"
    else
      url "https://downloads.okteto.com/cli/master/okteto-Darwin-x86_64"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "okteto-Darwin-arm64"
      mv bin/"okteto-Darwin-arm64", bin/"okteto"
    else
      bin.install "okteto-Darwin-x86_64"
      mv bin/"okteto-Darwin-x86_64", bin/"okteto"
    end
  end

  # Homebrew requires tests.
  test do
      assert_match "okteto version 2.6.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
