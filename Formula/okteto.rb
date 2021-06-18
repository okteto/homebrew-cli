class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.13.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "cdf1f244327a50d9070b2d54652a7e17b2cdabfc31d9872fb2559387f465a317"
    url "https://github.com/okteto/okteto/releases/download/1.13.0/okteto-Darwin-arm64"
  else
    sha256 "42172e13f76b27d34879b6f5df072a407ab653ee1ee88797bafa9c3ce32310d7"
    url "https://github.com/okteto/okteto/releases/download/1.13.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.13.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
