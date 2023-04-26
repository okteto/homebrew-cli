class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.15.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "3570ccd35c15fe3f88867f0ae027f782f2f2de32bc8a962d286eb7e1cde7c013"
    url "https://github.com/okteto/okteto/releases/download/2.15.1/okteto-Darwin-arm64"
  else
    sha256 "69b7d2419770dd598e5633551744337160da811a811ce5636e80754171ae344e"
    url "https://github.com/okteto/okteto/releases/download/2.15.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.15.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
