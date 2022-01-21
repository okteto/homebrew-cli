class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.15.0"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "34082e1d3135445f5844f390bfff75588449eff954a6ce3f20b93974c1223abf"
    url "https://github.com/okteto/okteto/releases/download/1.15.0/okteto-Darwin-arm64"
  else
    sha256 "543d8af2dd4659ed01a7280087d9aa49181ee23fcc66cd8015905592bf5e6eb9"
    url "https://github.com/okteto/okteto/releases/download/1.15.0/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.15.0", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
