class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/cd/7b/e77df4acf3c113830f2cfc7109aaa5486d7d0e959d2809cbfa50edcdf2ab/datalegion_cli-1.6.1.tar.gz"
  sha256 "1e1328e31cba7d5c0e1e06ed99f37c5bdbb45851b63987b9db6ee30b3bfb657d"
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
