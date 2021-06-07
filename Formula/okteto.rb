class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.15"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "da602afdd041cbf03d949fcad00d14e641e8ae23c3076d386c01d0079ff9eb91"
    url "https://github.com/okteto/okteto/releases/download/1.12.15/okteto-Darwin-arm64"
  else
    sha256 "0d0ffa55a7b3af2fd53109f1e5ebc56051f02169db3da6524e908ed0e9d7002e"
    url "https://github.com/okteto/okteto/releases/download/1.12.15/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.15", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
