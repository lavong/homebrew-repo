class CertChecker < Formula
    desc "Tool to display certificate chain infos"
    homepage "https://github.com/lavong/cert-checker"
    url "https://github.com/lavong/cert-checker/releases/download/0.5.0/cert-checker.zip"
    version "0.5.0"
    sha256 "ccde24bd1525426517d4c31f6ccc0cd5c27e58ad3504c4de7da525f371244ad6"
  
    depends_on "openjdk"
  
    def install
      rm_f Dir["bin/*.bat"]
      libexec.install %w[bin lib]
      (bin/"cert-checker").write_env_script libexec/"bin/cert-checker",
        :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
    end
  
    test do
      output = shell_output("#{bin}/cert-checker --help")
      assert_includes output, "Usage: cert-checker"
    end
end
