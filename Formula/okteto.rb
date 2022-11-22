class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.9.1"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "2149917aabc2510e597b5967fab36abaaf02731af9503a206798467ac46891c6"
    url "https://github.com/okteto/okteto/releases/download/2.9.1/okteto-Darwin-arm64"
  else
    sha256 "49015f2894a54847dab4688a306912f970f05c28173fd89985be61d72714fc6f"
    url "https://github.com/okteto/okteto/releases/download/2.9.1/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.9.1", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
