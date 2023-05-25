class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "dd721ab10d028fa1f0938f0461d6ef34c2ba16b760d611e8cc73382b25145c08"
    url "https://github.com/okteto/okteto/releases/download/2.16.0/okteto-Darwin-arm64"
  else
    sha256 "9c4e69937ce9e71e60a02611485cdae8bb133949b277faa6f95bf7ab813bb410"
    url "https://github.com/okteto/okteto/releases/download/2.16.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
