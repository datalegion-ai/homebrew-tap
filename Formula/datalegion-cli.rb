class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/1d/b9/6a5ed55638b6fec95d592e922341dd10646470c6e9527686f4f849cc6cf1/datalegion_cli-1.4.0.tar.gz"
  sha256 "695ce3b2593e4e1607ed5318bbb30aa214c3ab7c0b8c1599a01f062cb116f6ff"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = libexec/"venv"
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "datalegion-cli==#{version}"
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
