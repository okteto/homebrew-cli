class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "1.12.12"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "bea4a58d4e501d03d1a5deb4f276271b3fc507e39a4ce03b9fed312eefbc5fc0"
    url "https://github.com/okteto/okteto/releases/download/1.12.12/okteto-Darwin-arm64"
  else
    sha256 "f500147bc54df4ad76cf5995c4f8bebd1066d54bb6e77fcca083222b43981dce"
    url "https://github.com/okteto/okteto/releases/download/1.12.12/okteto-Darwin-x86_64"
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
      assert_match "okteto version 1.12.12", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
