class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.13.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "29c4a7aa790a58d2b3f4c45e8dfa6f98f7f2a9bca6686685c5ce223d368f24b0"
    url "https://github.com/okteto/okteto/releases/download/3.13.2/okteto-Darwin-arm64"
  else
    sha256 "f40c81d73a2c44a401c0552a4f7319b348fae526c46a99c2e5f515681ef0935b"
    url "https://github.com/okteto/okteto/releases/download/3.13.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.13.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
