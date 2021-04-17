class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.7"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "fe2161a299ba9596a9593d3f5e43b367a229ffc2390bcf294549fac8f7d2d95d"
    url "https://github.com/okteto/okteto/releases/download/1.12.7/okteto-Darwin-arm64"
  else
    sha256 "a2c4b139e9ec32d045770e1df7d536df6bff7a00a805ddbe18d9d9f4abcb471a"
    url "https://github.com/okteto/okteto/releases/download/1.12.7/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.7", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
