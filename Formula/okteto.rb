class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.16.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "47dc7a3361c81f7f5e5020bb1584fd7ebe810ae1187e5feee8339e9d0f6bc591"
    url "https://github.com/okteto/okteto/releases/download/2.16.2/okteto-Darwin-arm64"
  else
    sha256 "b5387f0fc4369af2b5757b27a2ee14e206129e22e7b448f2fdbe9423baa474aa"
    url "https://github.com/okteto/okteto/releases/download/2.16.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.16.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
