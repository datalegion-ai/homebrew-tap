class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/66/1f/f64d2e53eb9023a5ef2ff7fa679e63564a561c1ec37a3a41c5e02fc7f96e/datalegion_cli-1.0.2.tar.gz"
  sha256 "a9e9a444542e88fe29836c9613f0bba6d4a946da1e15fc184f6524c250a1d7ec"
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
