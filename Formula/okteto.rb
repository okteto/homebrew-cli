class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.19.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "7b12349de20b532a5b64039b353c5bf07d6e782dfaefa2a57283caee04267c67"
    url "https://github.com/okteto/okteto/releases/download/2.19.0/okteto-Darwin-arm64"
  else
    sha256 "365b0793b287036198953390d05db60d987e361a5dcf378bf54f0acd3b3b21b1"
    url "https://github.com/okteto/okteto/releases/download/2.19.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.19.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
