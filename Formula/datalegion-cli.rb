class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/1a/50/b43b816f998c43de60d08b578bd3acaa30fd8d63f3a63ebd80d12563faa8/datalegion_cli-1.3.0.tar.gz"
  sha256 "35cb2982919283ac1c23aa3f7d2e64d92656e185c42eb52effe8dfd0451fb144"
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
