class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.5"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "afe30721edca7ad98652a1539cceb5b14d2f8f12549230cb025508f7159a37f6"
    url "https://github.com/okteto/okteto/releases/download/1.15.5/okteto-Darwin-arm64"
  else
    sha256 "9a8dc9f54e4708aa3cd2b99c7e04bf4e27cdaedb813a62a692311e43700aa693"
    url "https://github.com/okteto/okteto/releases/download/1.15.5/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.5", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
