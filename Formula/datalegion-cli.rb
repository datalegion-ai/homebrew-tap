class DatalegionCli < Formula
  desc "CLI for the Data Legion API - agent-friendly, fully async"
  homepage "https://www.datalegion.ai"
  url "https://files.pythonhosted.org/packages/2d/3c/3d2b4933f3bd2b5d346795a6f6a96712df01981e27d3efa86808b5ce09b1/datalegion_cli-1.8.0.tar.gz"
  sha256 "30179eb7213650c670e98f43e78521af195135dbf5ea35af1eb725f8f4e8919e"
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
