class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.18.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "658b4f85304ceedd9ef33b7908b186182bf49042a05d955b4bab7e45f2f97890"
    url "https://github.com/okteto/okteto/releases/download/2.18.0/okteto-Darwin-arm64"
  else
    sha256 "5ce8f99418ce30125211258a7baa94a86a295eff6161f156e8c88394b3ad7f1f"
    url "https://github.com/okteto/okteto/releases/download/2.18.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.18.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
