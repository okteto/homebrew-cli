class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.7"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "13745012ca15062285272ab08747f14fdcc6e9b78355ee5af1d411ab9ed6386c"
    url "https://github.com/okteto/okteto/releases/download/1.14.7/okteto-Darwin-arm64"
  else
    sha256 "42cbe0dddff0b40b4655bd1f8cc8dc89c19bdd97ce213dfd8f7186ddbe92af97"
    url "https://github.com/okteto/okteto/releases/download/1.14.7/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.7", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
