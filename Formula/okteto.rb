class Okteto < Formula
  desc "Develop and test your code directly in Kubernetes"
  homepage "https://github.com/okteto/okteto"
  version "2.18.2"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    sha256 "892c31c522ff3e8b01e09caec9290cf80d18a9f8dcc2a5dcab48ff1756b9c62a"
    url "https://github.com/okteto/okteto/releases/download/2.18.2/okteto-Darwin-arm64"
  else
    sha256 "363e5687e9d8fc78fbd5a19add903daf8590f69f69c97198f0c40fa10d192e34"
    url "https://github.com/okteto/okteto/releases/download/2.18.2/okteto-Darwin-x86_64"
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
      assert_match "okteto version 2.18.2", shell_output("#{bin}/okteto version 2>&1", 0)
  end
end
