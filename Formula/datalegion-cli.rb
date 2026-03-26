class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/19/0b/91318172ba2c8b1fc3ad37278144c94ddcefd9db94a7fb4773a91ac39340/datalegion_cli-1.1.0.tar.gz"
  sha256 "62f5fe29ed7eacbd9bed31e1577804e722571b848bea72c2cf91cc0f67e24f93"
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
