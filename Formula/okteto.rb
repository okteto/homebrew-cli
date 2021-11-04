class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.14.4"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "4eb8589592e8000b15e9dc4e001c4c5adaaed689c5f3032edd661ed85606f632"
    url "https://github.com/okteto/okteto/releases/download/1.14.4/okteto-Darwin-arm64"
  else
    sha256 "3f4d73125359cc75ff9c4df3b47b7ceb94c13a962ec79a0fb18b4d80de75f456"
    url "https://github.com/okteto/okteto/releases/download/1.14.4/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.14.4", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
