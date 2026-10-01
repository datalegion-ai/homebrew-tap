class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/d7/8c/f8a4f01778158057229cbffe6613cb4cdbbd414b4196dec2fa17ea78cbe0/datalegion_cli-1.2.1.tar.gz"
  sha256 "473e1852876ec53d0db19c39008f84edd50a7b3052f852f244dbcb291a253f47"
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
