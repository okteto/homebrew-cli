class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.12.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "20fc9c68dc61d10ea3d9028a2b3ad6c35fad22cf5cdd4afdb57cb1c23ee63d84"
    url "https://github.com/okteto/okteto/releases/download/3.12.2/okteto-Darwin-arm64"
  else
    sha256 "85a5ca9cb9dd3a97d6c2beb9ec0e5e0cf417dcaf55365b2bad302fd19c13ff08"
    url "https://github.com/okteto/okteto/releases/download/3.12.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.12.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
