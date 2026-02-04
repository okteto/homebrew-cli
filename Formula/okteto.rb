class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.16.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "52548d349091b829d11e2337eb23b23e2f85f604a23e7193d472bc9ebbf590e0"
    url "https://github.com/okteto/okteto/releases/download/3.16.0/okteto-Darwin-arm64"
  else
    sha256 "9a1859a2940e3ae42caf542198a2e9829b1f7a3631beb903aa15c8b95fa22915"
    url "https://github.com/okteto/okteto/releases/download/3.16.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.16.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
