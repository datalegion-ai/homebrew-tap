class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/28/38/8518f61ca2e091307916d188289faa1e88eb4765455c7535436f79e52e1b/datalegion_cli-1.6.0.tar.gz"
  sha256 "dfc2fb22779222deab3cc3e12904ff411fa2c003d6fbe74e4c78fe4187804eb5"
  license "MIT"

  depends_on "python@3.15"

  def install
    venv = libexec/"venv"
    system Formula["python@3.15"].opt_bin/"python3.15", "-m", "venv", venv
    system venv/"bin/pip", "install", buildpath
    bin.install_symlink Dir[venv/"bin/datalegion-cli"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datalegion-cli version")
  end
end
