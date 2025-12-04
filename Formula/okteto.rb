class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "3.14.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b5efc47c314978b1facf2f84e7686b7075f02d05b9016c578f31f9495721e064"
    url "https://github.com/okteto/okteto/releases/download/3.14.0/okteto-Darwin-arm64"
  else
    sha256 "eeab7793563b685505867de424a411b02a10e20a1e8a73a813f50c3f9be778e1"
    url "https://github.com/okteto/okteto/releases/download/3.14.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 3.14.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
