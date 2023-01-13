class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.11.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "1ff59e0a17047ea13b023cf07190db35667c6955e0e2f8e51e1729bafe9c0544"
    url "https://github.com/okteto/okteto/releases/download/2.11.1/okteto-Darwin-arm64"
  else
    sha256 "f78faa8b9d7a66af31c0034cc4d92eea1591834c3e30f301d9104a431528a22f"
    url "https://github.com/okteto/okteto/releases/download/2.11.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.11.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
