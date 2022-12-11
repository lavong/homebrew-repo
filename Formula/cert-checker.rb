class CertChecker < Formula
    desc "Tool to display certificate chain infos"
    homepage "https://github.com/lavong/cert-checker"
    url "https://github.com/lavong/cert-checker/releases/download/0.2.0/cert-checker.zip"
    version "0.2.0"
    sha256 "667537177c99118a9fafeda1959552679dcc2a0f312332cdc82eba920496a084"
  
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
