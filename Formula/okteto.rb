class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.15.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "e90ae1fd8066d2856b00370ca67dbd9afba21d5c68e4e63c48f016d9cdeaa644"
    url "https://github.com/okteto/okteto/releases/download/2.15.4/okteto-Darwin-arm64"
  else
    sha256 "5ad1f04b86a12a8cda60dd6a9de7f7a722fd11c1e010af4ca7149cbdd63b7d01"
    url "https://github.com/okteto/okteto/releases/download/2.15.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.15.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
