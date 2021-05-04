class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.9"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "b5b8ce7a4926cca31a6a4dad6143e6e49c13009e0ded15ff212079e78c5e43fd"
    url "https://github.com/okteto/okteto/releases/download/1.12.9/okteto-Darwin-arm64"
  else
    sha256 "134da5f01508f5138cdd4392e50f6237e4e0bb2cfb4cdfffd86cde9b14768ec7"
    url "https://github.com/okteto/okteto/releases/download/1.12.9/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.9", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
