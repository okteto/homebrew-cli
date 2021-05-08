class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.10"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "ab22cdb2032e9d3aad0e3327658edc7756652ec1580b9b4921ef0cc0d14a161b"
    url "https://github.com/okteto/okteto/releases/download/1.12.10/okteto-Darwin-arm64"
  else
    sha256 "83f536eb910f4d171168f402ceace4f579fd63d1cf91c8804081d293d4d70c35"
    url "https://github.com/okteto/okteto/releases/download/1.12.10/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.10", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
