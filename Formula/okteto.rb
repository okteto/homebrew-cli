class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.2.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "62b7cdcce1073ada7e3e3482f4af3d76267d2190512d6729138fdeb82e43f4c7"
    url "https://github.com/okteto/okteto/releases/download/3.2.2/okteto-Darwin-arm64"
  else
    sha256 "1b18738a726cee8464ad13a2bf4a48fb229e7d0248c290d9feaf1c0b285f6034"
    url "https://github.com/okteto/okteto/releases/download/3.2.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.2.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
