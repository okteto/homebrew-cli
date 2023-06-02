class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7a7817736d1cc341db1577ab17576a0a7e1f509ad3c0e1c66ab6122f5d8222a1"
    url "https://github.com/okteto/okteto/releases/download/2.16.3/okteto-Darwin-arm64"
  else
    sha256 "25c41e3318352fb8814770e7dcc1d3471778e22eafb46221cd7da98015666657"
    url "https://github.com/okteto/okteto/releases/download/2.16.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
