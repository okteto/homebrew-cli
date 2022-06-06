class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.3.3"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "106da449faf9eda2d4fe52eaef8788209b63d522b060ecc6ca54b7f1f56a6a09"
    url "https://github.com/okteto/okteto/releases/download/2.3.3/okteto-Darwin-arm64"
  else
    sha256 "56c83e457dbf1bec3887f50cfd9426e56d9faffe15384bd4639140b9fc836699"
    url "https://github.com/okteto/okteto/releases/download/2.3.3/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.3.3", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
