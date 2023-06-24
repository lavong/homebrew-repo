class CertChecker < Formula
    desc "Tool to display certificate chain infos"
    homepage "https://github.com/lavong/cert-checker"
    url "https://github.com/lavong/cert-checker/releases/download/0.4.0/cert-checker.zip"
    version "0.4.0"
    sha256 "14d0a1361997426dcca66fb92828f768fb308b6075a5ba05e9d56c02902ebad8"
  
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
