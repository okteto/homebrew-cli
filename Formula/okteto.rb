class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.25.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "db1dea004126b081d3e09655a6742840c445768cd976dacbf39e66d2c440f05d"
    url "https://github.com/okteto/okteto/releases/download/2.25.1/okteto-Darwin-arm64"
  else
    sha256 "7832dc64d50fb563d8668a06484c434b0e2e8c50b19b487461379f2f3671ccc2"
    url "https://github.com/okteto/okteto/releases/download/2.25.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.25.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
