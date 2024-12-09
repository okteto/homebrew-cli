class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.2.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "fbda9359d3b20d5ee77fa6011425d049a553eecfa4c8a05758f47a5fcd91c6f2"
    url "https://github.com/okteto/okteto/releases/download/3.2.0/okteto-Darwin-arm64"
  else
    sha256 "5fcc1466ae4fd6d1c588b8889614acb73710caa94b53ba03600041b58129c9c9"
    url "https://github.com/okteto/okteto/releases/download/3.2.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.2.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
