class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/5c/39/9a9d79c0c164affcf3e06af43c518fdcf7e0f7f53c62cafd33476345ac56/datalegion_cli-1.2.0.tar.gz"
  sha256 "6fcdc231c1720bbee190bf093353c69395032c000a76690eeae0edea2728ec75"
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
